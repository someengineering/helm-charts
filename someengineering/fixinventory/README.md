# fixinventory

![Version: 0.10.5](https://img.shields.io/badge/Version-0.10.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.5](https://img.shields.io/badge/AppVersion-4.0.5-informational?style=flat-square)

A Helm chart for installing Fix Inventory in Kubernetes.

**Homepage:** <https://inventory.fix.security>

## Source Code

* <https://github.com/someengineering/fixinventory>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://arangodb.github.io/kube-arangodb | arangodb(kube-arangodb) | 1.2.26 |
| https://charts.bitnami.com/bitnami | common(common) | 2.4.0 |
| https://prometheus-community.github.io/helm-charts | prometheus | 18.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Configure node affinity for all pods. |
| arangodb | object | `{"operator":{"deployment":{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"},"enabled":false,"replicaCount":1},"persistentVolumeClaimSpec":{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"50Gi"}}},"version":"3.10.4"}` | Install ArangoDB operator as dependency. |
| arangodb.operator | object | `{"deployment":{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"},"enabled":false,"replicaCount":1}` | See: https://www.arangodb.com/docs/stable/deployment-kubernetes-helm.html#configurable-values-for-arangodb-kubernetes-operator for a list of possible configuration values. |
| arangodb.operator.deployment | object | `{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"}` | Defines the ArangoDB deployment and database. |
| arangodb.operator.deployment.externalAccessType | string | `"None"` | Should the database externally accessible. https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specexternalaccesstype-string |
| arangodb.operator.deployment.mode | string | `"Single"` | The ArangoDB deployment mode. Can be either "Cluster", "ActiveFailover" or "Single". https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specmode-string |
| arangodb.operator.deployment.spec | object | `{}` | The arangodb specification. https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specification-reference |
| arangodb.operator.deployment.tlsCASecretName | string | `"None"` | Secret name that holds the ArangoDB certificate authority. |
| arangodb.operator.enabled | bool | `false` | The ArangoDB operator is helpful for more complex deployments. Default is disabled, while a single instance database deployment is performed. |
| arangodb.operator.replicaCount | int | `1` | Replication count for Operator deployment. |
| arangodb.persistentVolumeClaimSpec | object | `{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"50Gi"}}}` | The size of the volume for the database data. |
| arangodb.version | string | `"3.10.4"` | The version of ArangoDB to use. |
| fixcore | object | `{"extraArgs":[],"extraEnv":[],"graphdb":{"database":"fix","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://graph-db-server:8529","username":"fix"},"image":{"repository":"somecr.io/someengineering/fixcore","tag":""},"ingress":{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}],"tls":[],"useHttpsService":false},"overrides":["fixcore.runtime.start_collect_on_subscriber_connect=true"],"resources":{},"service":{"port":8900,"type":"ClusterIP"}}` | Configuration for Fix Core. |
| fixcore.extraArgs | list | `[]` | Use this section to define extra arguments |
| fixcore.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| fixcore.graphdb | object | `{"database":"fix","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://graph-db-server:8529","username":"fix"}` | This defines the access to the graph database |
| fixcore.graphdb.database | string | `"fix"` | The name of the database to use |
| fixcore.graphdb.passwordSecret | object | `{"key":"password","name":"arango-user"}` | The secret to get the password from |
| fixcore.graphdb.passwordSecret.key | string | `"password"` | The secret key to get the password from |
| fixcore.graphdb.passwordSecret.name | string | `"arango-user"` | The secret name to get the password from |
| fixcore.graphdb.server | string | `"http://graph-db-server:8529"` | The complete url of the graph database |
| fixcore.graphdb.username | string | `"fix"` | The name of the user to connect |
| fixcore.image.repository | string | `"somecr.io/someengineering/fixcore"` | Image repository |
| fixcore.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| fixcore.ingress.annotations | object | `{}` | All annotations for the ingress. In case the ingress controller is configured to use HTTPS, the following annotations are defined by default: className =~ nginx: - see: https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#backend-protocol - "nginx.ingress.kubernetes.io/backend-protocol" is set to "HTTPS" by default. |
| fixcore.ingress.className | string | `""` | The class of the ingress. If omitted, the configured default ingress class is used. |
| fixcore.ingress.enabled | bool | `false` | In case you want to expose the service outside the k8s cluster, you can use an ingress. |
| fixcore.ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress host configuration. |
| fixcore.ingress.useHttpsService | bool | `false` | Configure ingress to talk to the service via HTTPS. If enabled, the ingress controller needs to be configured for that. Turning it on without additional user configuration, will most likely render your ingress unusable! Since this configuration is specific for the ingress controller implementation, it can not be provided by this chart. Please refer to the documentation of your ingress controller for further information. |
| fixcore.overrides | list | `["fixcore.runtime.start_collect_on_subscriber_connect=true"]` | Use this section to override configuration values |
| fixcore.overrides[0] | string | `"fixcore.runtime.start_collect_on_subscriber_connect=true"` | start a collect cycle automatically when the first collector is connected |
| fixcore.resources | object | `{}` | Define resources requests and limits for this pod. |
| fixcore.service.port | int | `8900` | Port of the service to expose. Two services will be created: fixinventory-fixcore:8900 (HTTPS) and fixinventory-fixcore-http:8900 (HTTP) |
| fixcore.service.type | string | `"ClusterIP"` | Type of service. ClusterIP is only reachable within the cluster. If you want to make your installation available outside the cluster, consider setting up an ingress or use type LoadBalancer. |
| fixmetrics | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/fixmetrics","tag":""},"overrides":[],"resources":{},"serviceMonitor":{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}}` | Configuration for Fix Metrics. |
| fixmetrics.extraArgs | list | `[]` | Use this section to define extra arguments |
| fixmetrics.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| fixmetrics.image.repository | string | `"somecr.io/someengineering/fixmetrics"` | Image repository |
| fixmetrics.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| fixmetrics.overrides | list | `[]` | Use this section to override configuration values |
| fixmetrics.resources | object | `{}` | Define resources requests and limits for this pod. |
| fixmetrics.serviceMonitor | object | `{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}` | Prometheus serviceMonitor configuration |
| fixmetrics.serviceMonitor.enabled | bool | `false` | Whether a Prometheus serviceMonitor should be created |
| fixmetrics.serviceMonitor.interval | string | `"30s"` | Metrics scrape interval |
| fixmetrics.serviceMonitor.scrapeTimeout | string | `"25s"` | Metrics scrape timeout |
| fixworker | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/fixworker","tag":""},"overrides":[],"resources":{},"volumeMounts":[],"volumes":[]}` | Configuration for Fix Worker. |
| fixworker.extraArgs | list | `[]` | Use this section to define extra arguments |
| fixworker.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| fixworker.image.repository | string | `"somecr.io/someengineering/fixworker"` | Image repository |
| fixworker.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| fixworker.overrides | list | `[]` | Use this section to override configuration values |
| fixworker.resources | object | `{}` | Define resources requests and limits for this pod. |
| fixworker.volumeMounts | list | `[]` | Use this section to define volume mounts for the worker |
| fixworker.volumes | list | `[]` | Use this section to define volumes of the worker |
| fullnameOverride | string | `""` | In case you want to override the generated fully qualified application name. |
| image | object | `{"tag":""}` | Image tag used for all Fix Inventory components. |
| image.tag | string | `""` | The specific component version always takes precedence. |
| imagePullPolicy | string | `"IfNotPresent"` | The image pull policy |
| imagePullSecrets | list | `[]` | In case you use a custom repository which needs secrets. |
| nameOverride | string | `""` | In case you want to override the name of this chart. |
| nodeSelector | object | `{}` | Configure node selectors for all pods. |
| podAnnotations | object | `{}` | Configure annotations for all pods. |
| podSecurityContext | object | `{}` | Configure the security context on the pod level. |
| prometheus | object | `{"enabled":true,"server":{"persistentVolume":{"size":"50Gi"},"retention":"730d"}}` | Configure the prometheus component. Type helm show values prometheus-community/prometheus for a list of possible configuration values. |
| prometheus.enabled | bool | `true` | You can disable the Prometheus dependency by setting this to false. |
| prometheus.server | object | `{"persistentVolume":{"size":"50Gi"},"retention":"730d"}` | Define attributes for the Prometheus service. |
| prometheus.server.persistentVolume | object | `{"size":"50Gi"}` | Define the persistent volume properties. |
| prometheus.server.persistentVolume.size | string | `"50Gi"` | Size of the persistent volume. |
| prometheus.server.retention | string | `"730d"` | Duration to keep time series data. |
| psk | string | `""` | Defines the private shared key that is used to secure the communication between the components. If the value is not set, a random key is generated. You can get the psk from the secret fixinventory-psk. |
| replicaCount | int | `1` | Defines the number of workers to run in parallel. Only increase this number, if you know what you are doing. |
| securityContext | object | `{}` | Configure the security context on the container level. |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Define and configure a service account that used by Fix Inventory. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Configure toleration's for all pods. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
