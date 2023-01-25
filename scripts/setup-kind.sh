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

helm install --namespace resoto arango-crd https://github.com/arangodb/kube-arangodb/releases/download/1.2.20/kube-arangodb-crd-1.2.20.tgz

if [ -z "${CI_ENABLED}" ]; then
helm repo add someengineering https://someengineering.github.io/helm-charts
helm install --namespace resoto resoto someengineering/resoto --set image.tag=$IMAGE_TAG -f - <<EOF
  resotocore:
    extraArgs: ["--analytics-opt-out"]
EOF
else
  DIR="$(dirname "$(realpath "$0")")"
  helm dependency update "$DIR/../someengineering/resoto"
  helm upgrade -i --namespace resoto resoto "$DIR/../someengineering/resoto" --set image.tag=$IMAGE_TAG -f - <<EOF
  resotocore:
    extraArgs: ["--analytics-opt-out"]
EOF
fi

# wait for it to be ready
kubectl --namespace resoto rollout status deploy/resoto-resotocore --timeout=600s
kubectl --namespace resoto rollout status deploy/resoto-resotoworker --timeout=300s
kubectl --namespace resoto rollout status deploy/resoto-resotometrics --timeout=300s

# see an example query!
echo 'Setup done. You can now run queries. For example:'
echo 'kubectl --namespace resoto exec -i deploy/resoto-resotocore -- resh --stdin <<EOF'
echo 'query is(resource) | count reported.kind'
echo 'EOF'
