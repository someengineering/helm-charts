# resoto

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.3.0](https://img.shields.io/badge/AppVersion-2.3.0-informational?style=flat-square)

A Helm chart for Kubernetes

**Homepage:** <https://resoto.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| kushthedude |  |  |
| aquamatthias | <eng@some.engineering> |  |

## Source Code

* <https://github.com/someengineering/resoto>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repositoryFolder | string | `"ghcr.io/someengineering"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resotocore.extraArgs | list | `[]` |  |
| resotocore.extraEnv | list | `[]` |  |
| resotocore.graphdb.database | string | `"resoto"` |  |
| resotocore.graphdb.passwordSecret.key | string | `"password"` |  |
| resotocore.graphdb.passwordSecret.name | string | `"arango-user"` |  |
| resotocore.graphdb.server | string | `"http://single-server:8529"` |  |
| resotocore.graphdb.username | string | `"resoto"` |  |
| resotocore.ingress.annotations | object | `{}` |  |
| resotocore.ingress.className | string | `""` |  |
| resotocore.ingress.enabled | bool | `false` |  |
| resotocore.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| resotocore.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| resotocore.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| resotocore.ingress.tls | list | `[]` |  |
| resotocore.overrides[0] | string | `"resotocore.runtime.start_collect_on_subscriber_connect=true"` |  |
| resotocore.overrides[1] | string | `"resotocore.api.ui_path=/usr/local/resoto/ui/"` |  |
| resotocore.service.port | int | `8900` |  |
| resotocore.service.type | string | `"ClusterIP"` |  |
| resotometrics.extraArgs | list | `[]` |  |
| resotometrics.extraEnv | list | `[]` |  |
| resotometrics.overrides | list | `[]` |  |
| resotometrics.serviceMonitor.enabled | bool | `false` |  |
| resotometrics.serviceMonitor.interval | string | `"30s"` |  |
| resotometrics.serviceMonitor.scrapeTimeout | string | `"25s"` |  |
| resotoworker.extraArgs | list | `[]` |  |
| resotoworker.extraEnv | list | `[]` |  |
| resotoworker.overrides | list | `[]` |  |
| resotoworker.volumeMounts | list | `[]` |  |
| resotoworker.volumes | list | `[]` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)