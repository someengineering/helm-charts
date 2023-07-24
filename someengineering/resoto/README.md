# resoto

![Version: 0.9.4](https://img.shields.io/badge/Version-0.9.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.6.3](https://img.shields.io/badge/AppVersion-3.6.3-informational?style=flat-square)

A Helm chart for Kubernetes

**Homepage:** <https://resoto.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| aquamatthias | <eng@some.engineering> |  |

## Source Code

* <https://github.com/someengineering/resoto>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://arangodb.github.io/kube-arangodb | arangodb(kube-arangodb) | 1.2.26 |
| https://charts.bitnami.com/bitnami | common(common) | 2.4.0 |
| https://prometheus-community.github.io/helm-charts | prometheus | 22.6.6 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Configure node affinity for all pods. |
| arangodb | object | `{"operator":{"deployment":{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"},"enabled":false,"replicaCount":1},"persistentVolumeSize":"50Gi","version":"3.10.4"}` | Install ArangoDB operator as dependency. |
| arangodb.operator | object | `{"deployment":{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"},"enabled":false,"replicaCount":1}` | See: https://www.arangodb.com/docs/stable/deployment-kubernetes-helm.html#configurable-values-for-arangodb-kubernetes-operator for a list of possible configuration values. |
| arangodb.operator.deployment | object | `{"externalAccessType":"None","mode":"Single","spec":{},"tlsCASecretName":"None"}` | Defines the ArangoDB deployment and database. |
| arangodb.operator.deployment.externalAccessType | string | `"None"` | Should the database externally accessible. https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specexternalaccesstype-string |
| arangodb.operator.deployment.mode | string | `"Single"` | The ArangoDB deployment mode. Can be either "Cluster", "ActiveFailover" or "Single". https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specmode-string |
| arangodb.operator.deployment.spec | object | `{}` | The arangodb specification. https://www.arangodb.com/docs/stable/deployment-kubernetes-deployment-resource.html#specification-reference |
| arangodb.operator.deployment.tlsCASecretName | string | `"None"` | Secret name that holds the ArangoDB certificate authority. |
| arangodb.operator.enabled | bool | `false` | The ArangoDB operator is helpful for more complex deployments. Default is disabled, while a single instance database deployment is performed. |
| arangodb.operator.replicaCount | int | `1` | Replication count for Operator deployment. |
| arangodb.persistentVolumeSize | string | `"50Gi"` | The size of the volume for the database data. |
| arangodb.version | string | `"3.10.4"` | The version of ArangoDB to use. |
| fullnameOverride | string | `""` | In case you want to override the generated fully qualified application name. |
| image | object | `{"tag":""}` | Image tag used for all resoto components. |
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
| psk | string | `""` | Defines the private shared key that is used to secure the communication between the components. If the value is not set, a random key is generated. You can get the psk from the secret resoto-psk. |
| replicaCount | int | `1` | Defines the number of workers to run in parallel. Only increase this number, if you know what you are doing. |
| resotocore | object | `{"extraArgs":[],"extraEnv":[],"graphdb":{"database":"resoto","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://graph-db-server:8529","username":"resoto"},"image":{"repository":"somecr.io/someengineering/resotocore","tag":""},"ingress":{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}],"tls":[],"useHttpsService":false},"overrides":["resotocore.runtime.start_collect_on_subscriber_connect=true"],"resources":{},"service":{"port":8900,"type":"ClusterIP"}}` | Configuration for ResotoCore. |
| resotocore.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotocore.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotocore.graphdb | object | `{"database":"resoto","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://graph-db-server:8529","username":"resoto"}` | This defines the access to the graph database |
| resotocore.graphdb.database | string | `"resoto"` | The name of the database to use |
| resotocore.graphdb.passwordSecret | object | `{"key":"password","name":"arango-user"}` | The secret to get the password from |
| resotocore.graphdb.passwordSecret.key | string | `"password"` | The secret key to get the password from |
| resotocore.graphdb.passwordSecret.name | string | `"arango-user"` | The secret name to get the password from |
| resotocore.graphdb.server | string | `"http://graph-db-server:8529"` | The complete url of the graph database |
| resotocore.graphdb.username | string | `"resoto"` | The name of the user to connect |
| resotocore.image.repository | string | `"somecr.io/someengineering/resotocore"` | Image repository |
| resotocore.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotocore.ingress.annotations | object | `{}` | All annotations for the ingress. In case the ingress controller is configured to use HTTPS, the following annotations are defined by default: className =~ nginx: - see: https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#backend-protocol - "nginx.ingress.kubernetes.io/backend-protocol" is set to "HTTPS" by default. |
| resotocore.ingress.className | string | `""` | The class of the ingress. If omitted, the configured default ingress class is used. |
| resotocore.ingress.enabled | bool | `false` | In case you want to expose the service outside the k8s cluster, you can use an ingress. |
| resotocore.ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress host configuration. |
| resotocore.ingress.useHttpsService | bool | `false` | Configure ingress to talk to the service via HTTPS. If enabled, the ingress controller needs to be configured for that. Turning it on without additional user configuration, will most likely render your ingress unusable! Since this configuration is specific for the ingress controller implementation, it can not be provided by this chart. Please refer to the documentation of your ingress controller for further information. |
| resotocore.overrides | list | `["resotocore.runtime.start_collect_on_subscriber_connect=true"]` | Use this section to override configuration values |
| resotocore.overrides[0] | string | `"resotocore.runtime.start_collect_on_subscriber_connect=true"` | start a collect cycle automatically when the first collector is connected |
| resotocore.resources | object | `{}` | Define resources requests and limits for this pod. |
| resotocore.service.port | int | `8900` | Port of the service to expose. Two services will be created: resoto-resotocore:8900 (HTTPS) and resoto-resotocore-http:8900 (HTTP) |
| resotocore.service.type | string | `"ClusterIP"` | Type of service. ClusterIP is only reachable within the cluster. If you want to make your installation available outside the cluster, consider setting up an ingress or use type LoadBalancer. |
| resotometrics | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/resotometrics","tag":""},"overrides":[],"resources":{},"serviceMonitor":{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}}` | Configuration for ResotoMetrics. |
| resotometrics.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotometrics.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotometrics.image.repository | string | `"somecr.io/someengineering/resotometrics"` | Image repository |
| resotometrics.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotometrics.overrides | list | `[]` | Use this section to override configuration values |
| resotometrics.resources | object | `{}` | Define resources requests and limits for this pod. |
| resotometrics.serviceMonitor | object | `{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}` | Prometheus serviceMonitor configuration |
| resotometrics.serviceMonitor.enabled | bool | `false` | Whether a Prometheus serviceMonitor should be created |
| resotometrics.serviceMonitor.interval | string | `"30s"` | Metrics scrape interval |
| resotometrics.serviceMonitor.scrapeTimeout | string | `"25s"` | Metrics scrape timeout |
| resotoworker | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/resotoworker","tag":""},"overrides":[],"resources":{},"volumeMounts":[],"volumes":[]}` | Configuration for ResotoWorker. |
| resotoworker.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotoworker.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotoworker.image.repository | string | `"somecr.io/someengineering/resotoworker"` | Image repository |
| resotoworker.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotoworker.overrides | list | `[]` | Use this section to override configuration values |
| resotoworker.resources | object | `{}` | Define resources requests and limits for this pod. |
| resotoworker.volumeMounts | list | `[]` | Use this section to define volume mounts for the worker |
| resotoworker.volumes | list | `[]` | Use this section to define volumes of the worker |
| securityContext | object | `{}` | Configure the security context on the container level. |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Define and configure a service account that used by Resoto. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Configure toleration's for all pods. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
