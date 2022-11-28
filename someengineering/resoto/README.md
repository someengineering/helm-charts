# resoto

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.7](https://img.shields.io/badge/AppVersion-2.4.7-informational?style=flat-square)

A Helm chart for Kubernetes

**Homepage:** <https://resoto.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| kushthedude |  |  |
| aquamatthias | <eng@some.engineering> |  |

## Source Code

* <https://github.com/someengineering/resoto>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://arangodb.github.io/kube-arangodb | arangodb(kube-arangodb) | 1.2.20 |
| https://charts.bitnami.com/bitnami | common(common) | 2.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| arangoDB | object | `{"enabled":true,"operator":{"replicaCount":1}}` | Install ArangoDB operator as dependency. |
| arangoDB.enabled | bool | `true` | You can disable the ArangoDB operator dependency by setting this to false. |
| arangoDB.operator | object | `{"replicaCount":1}` | For a list of possible configuration values. |
| arangoDB.operator.replicaCount | int | `1` | Replication count for Operator deployment. |
| fullnameOverride | string | `""` | In case you want to override the generated fully qualified application name. |
| imagePullPolicy | string | `"IfNotPresent"` | The image pull policy |
| imagePullSecrets | list | `[]` | In case you use a custom repository which needs secrets. |
| nameOverride | string | `""` | In case you want to override the name of this chart. |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | Configure annotations for all pods. |
| podSecurityContext | object | `{}` | Configure the security context on the pod level. |
| replicaCount | int | `1` | Only increase this number, if you know what you are doing. |
| resotocore | object | `{"extraArgs":[],"extraEnv":[],"graphdb":{"database":"resoto","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://single-server:8529","username":"resoto"},"image":{"repository":"somecr.io/someengineering/resotocore","tag":""},"ingress":{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]},"overrides":["resotocore.runtime.start_collect_on_subscriber_connect=true","resotocore.api.ui_path=/usr/local/resoto/ui/"],"service":{"port":8900,"type":"ClusterIP"}}` | Configuration for ResotoCore. |
| resotocore.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotocore.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotocore.graphdb | object | `{"database":"resoto","passwordSecret":{"key":"password","name":"arango-user"},"server":"http://single-server:8529","username":"resoto"}` | This defines the access to the graph database |
| resotocore.graphdb.database | string | `"resoto"` | The name of the database to use |
| resotocore.graphdb.passwordSecret | object | `{"key":"password","name":"arango-user"}` | The secret to get the password from |
| resotocore.graphdb.passwordSecret.key | string | `"password"` | The secret key to get the password from |
| resotocore.graphdb.passwordSecret.name | string | `"arango-user"` | The secret name to get the password from |
| resotocore.graphdb.server | string | `"http://single-server:8529"` | The complete url of the graph database |
| resotocore.graphdb.username | string | `"resoto"` | The name of the user to connect |
| resotocore.image.repository | string | `"somecr.io/someengineering/resotocore"` | Image repository |
| resotocore.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotocore.ingress.annotations | object | `{}` | All annotations for the ingress. |
| resotocore.ingress.className | string | `""` | The class of the ingress. If omitted, the configured default ingress class is used. |
| resotocore.ingress.enabled | bool | `false` | In case you want to expose the service outside the k8s cluster, you can use an ingress. |
| resotocore.ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Ingress host configuration. |
| resotocore.overrides | list | `["resotocore.runtime.start_collect_on_subscriber_connect=true","resotocore.api.ui_path=/usr/local/resoto/ui/"]` | Use this section to override configuration values |
| resotocore.overrides[0] | string | `"resotocore.runtime.start_collect_on_subscriber_connect=true"` | start a collect cycle automatically when the first collector is connected |
| resotocore.overrides[1] | string | `"resotocore.api.ui_path=/usr/local/resoto/ui/"` | this is location of the UI in the docker container |
| resotocore.service.port | int | `8900` | Port of the service. |
| resotocore.service.type | string | `"ClusterIP"` | If you want to make your installation available outside the cluster, consider setting up an ingress or use type LoadBalancer. |
| resotometrics | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/resotometrics","tag":""},"overrides":[],"serviceMonitor":{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}}` | Configuration for ResotoMetrics. |
| resotometrics.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotometrics.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotometrics.image.repository | string | `"somecr.io/someengineering/resotometrics"` | Image repository |
| resotometrics.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotometrics.overrides | list | `[]` | Use this section to override configuration values |
| resotometrics.serviceMonitor | object | `{"enabled":false,"interval":"30s","scrapeTimeout":"25s"}` | Prometheus serviceMonitor configuration |
| resotometrics.serviceMonitor.enabled | bool | `false` | Whether a Prometheus serviceMonitor should be created |
| resotometrics.serviceMonitor.interval | string | `"30s"` | Metrics scrape interval |
| resotometrics.serviceMonitor.scrapeTimeout | string | `"25s"` | Metrics scrape timeout |
| resotoworker | object | `{"extraArgs":[],"extraEnv":[],"image":{"repository":"somecr.io/someengineering/resotoworker","tag":""},"overrides":[],"volumeMounts":[],"volumes":[]}` | Configuration for ResotoWorker. |
| resotoworker.extraArgs | list | `[]` | Use this section to define extra arguments |
| resotoworker.extraEnv | list | `[]` | Use this section to pass extra environment variables |
| resotoworker.image.repository | string | `"somecr.io/someengineering/resotoworker"` | Image repository |
| resotoworker.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| resotoworker.overrides | list | `[]` | Use this section to override configuration values |
| resotoworker.volumeMounts | list | `[]` | Use this section to define volume mounts for the worker |
| resotoworker.volumes | list | `[]` | Use this section to define volumes of the worker |
| resources | object | `{}` |  |
| securityContext | object | `{}` | Configure the security context on the container level. |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Define and configure a service account that used by Resoto. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
