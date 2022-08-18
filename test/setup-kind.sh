#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

IMAGE_TAG="${IMAGE_TAG:-edge}"
NO_START_KIND="${NO_START_KIND:-}"
CI_ENABLED=${CI_ENABLED:-}

if [ -z "${NO_START_KIND}" ]; then
  kind create cluster
fi

kubectl create ns resoto

# deploy db operator.
helm install --namespace resoto arango-crd https://github.com/arangodb/kube-arangodb/releases/download/1.2.4/kube-arangodb-crd-1.2.4.tgz
helm install --namespace resoto arango https://github.com/arangodb/kube-arangodb/releases/download/1.2.4/kube-arangodb-1.2.4.tgz --set operator.replicaCount=1

# wait for operator to be ready.
kubectl --namespace resoto rollout status deploy/arango-arango-operator --timeout=300s
# deploy a db.
kubectl --namespace resoto apply -f - <<EOF
apiVersion: "database.arangodb.com/v1alpha"
kind: "ArangoDeployment"
metadata:Gi
  name: "single-server"
spec:
  mode: Single
  tls:
    caSecretName: None
EOF

# wait for the db deployment is ready.
kubectl --namespace resoto wait --for=condition=ready arangodeployment/single-server --timeout=300s

# get the db's pod.
ARANGO_DB_POD=$(kubectl --namespace resoto get pod -larango_deployment=single-server -o name)

# wait until the db is ready to accept clients.
timeout 1m $SHELL -c "until kubectl --namespace resoto exec $ARANGO_DB_POD -- /lifecycle/tools/arangodb_operator lifecycle probe --endpoint=/_api/version --auth; do sleep 1; done"

if [ -z "${CI_ENABLED}" ]; then
helm repo add someengineering https://someengineering.github.io/helm-charts
  helm install --namespace resoto resoto someengineering/resoto --set image.tag=$IMAGE_TAG -f - <<EOF
  resotocore:
    graphdb:
      server: http://single-server:8529
EOF
else
  DIR="$(dirname "$(realpath "$0")")"
  helm upgrade -i --namespace resoto resoto "$DIR/charts/resoto" --set image.tag=$IMAGE_TAG -f - <<EOF
  resotocore:
    graphdb:
      server: http://single-server:8529
EOF
fi

# wait for it to be ready
kubectl --namespace resoto rollout status deploy/resoto-resotocore --timeout=300s
kubectl --namespace resoto rollout status deploy/resoto-resotoworker --timeout=300s
kubectl --namespace resoto rollout status deploy/resoto-resotometrics --timeout=300s

# see an example query!
echo 'Setup done. You can now run queries. For example:'
echo 'kubectl --namespace resoto exec -i deploy/resoto-resotocore -- resh --stdin <<EOF'
echo 'query is(resource) | count reported.kind'
echo 'EOF'