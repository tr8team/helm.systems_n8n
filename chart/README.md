# gotrade-n8n

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.72.0](https://img.shields.io/badge/AppVersion-1.72.0-informational?style=flat-square)

Gotrade's Helm chart to deploy self-hosted n8n workflow automation

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 18.1.3 |
| https://charts.bitnami.com/bitnami | redis | 23.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{"tr8.io/designation":"workflow-engine","tr8.io/landscape":"develop","tr8.io/layer":"2","tr8.io/platform":"automation","tr8.io/service":"n8n","tr8.io/team":"DevOps"}` | Additional annotations to add to all resources |
| additionalAnnotations."tr8.io/designation" | string | `"workflow-engine"` | D of LPSD of Gotrade Service Tree |
| additionalAnnotations."tr8.io/landscape" | string | `"develop"` | L of LPSD of Gotrade Service Tree |
| additionalAnnotations."tr8.io/layer" | string | `"2"` | Infrastructure layer this application belongs to |
| additionalAnnotations."tr8.io/platform" | string | `"automation"` | P of LPSD of Gotrade Service Tree |
| additionalAnnotations."tr8.io/service" | string | `"n8n"` | S of LPSD of Gotrade Service Tree |
| additionalAnnotations."tr8.io/team" | string | `"DevOps"` | Team in charge of this chart |
| additionalLabels | object | `{"tr8.io/designation":"workflow-engine","tr8.io/landscape":"develop","tr8.io/layer":"2","tr8.io/platform":"automation","tr8.io/service":"n8n","tr8.io/team":"DevOps"}` | Additional labels to add to all resources |
| additionalLabels."tr8.io/designation" | string | `"workflow-engine"` | D of LPSD of Gotrade Service Tree |
| additionalLabels."tr8.io/landscape" | string | `"develop"` | L of LPSD of Gotrade Service Tree |
| additionalLabels."tr8.io/layer" | string | `"2"` | Infrastructure layer this application belongs to |
| additionalLabels."tr8.io/platform" | string | `"automation"` | P of LPSD of Gotrade Service Tree |
| additionalLabels."tr8.io/service" | string | `"n8n"` | S of LPSD of Gotrade Service Tree |
| additionalLabels."tr8.io/team" | string | `"DevOps"` | Team in charge of this chart |
| affinity | object | `{}` | Affinity |
| externalDatabase | object | `{"database":"n8n","host":"","password":"","port":5432,"user":"n8n"}` | External PostgreSQL configuration (when postgresql.enabled=false) |
| externalRedis | object | `{"host":"","password":"","port":6379}` | External Redis configuration (when redis.enabled=false) |
| extraEnv | list | `[]` | Extra environment variables |
| extraVolumeMounts | list | `[]` | Extra volume mounts |
| extraVolumes | list | `[]` | Extra volumes |
| fullnameOverride | string | `""` | Override the full name |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"n8nio/n8n","tag":""}` | n8n image configuration |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress | object | `{"annotations":{},"className":"shared-alb","enabled":false,"host":"n8n.example.com","path":"/","pathType":"Prefix"}` | Ingress configuration |
| n8n | object | `{"editorBaseUrl":"https://n8n.example.com/","encryptionKey":"changeme-generate-with-openssl-rand-hex-32","host":"n8n.example.com","protocol":"https","timezone":"UTC","webhookUrl":"https://n8n.example.com/"}` | n8n specific configuration |
| n8n.editorBaseUrl | string | `"https://n8n.example.com/"` | Editor base URL |
| n8n.encryptionKey | string | `"changeme-generate-with-openssl-rand-hex-32"` | Encryption key for credentials (MUST be changed in production) Generate with: openssl rand -hex 32 |
| n8n.host | string | `"n8n.example.com"` | Host for n8n |
| n8n.protocol | string | `"https"` | Protocol (http or https) |
| n8n.timezone | string | `"UTC"` | Timezone for n8n |
| n8n.webhookUrl | string | `"https://n8n.example.com/"` | Webhook URL |
| nameOverride | string | `""` | Override the name |
| nodeSelector | object | `{}` | Node selector |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"10Gi","storageClass":""}` | Persistence configuration |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes |
| persistence.annotations | object | `{}` | Annotations for PVC |
| persistence.existingClaim | string | `""` | Use an existing PVC |
| persistence.size | string | `"10Gi"` | Storage size |
| persistence.storageClass | string | `""` | Storage class |
| podAnnotations | object | `{"tr8.io/designation":"workflow-engine","tr8.io/landscape":"develop","tr8.io/layer":"2","tr8.io/platform":"automation","tr8.io/service":"n8n","tr8.io/team":"DevOps","tr8.io/version":"1.0.0"}` | Pod annotations |
| podAnnotations."tr8.io/designation" | string | `"workflow-engine"` | D of LPSD of Gotrade Service Tree |
| podAnnotations."tr8.io/landscape" | string | `"develop"` | L of LPSD of Gotrade Service Tree |
| podAnnotations."tr8.io/layer" | string | `"2"` | Infrastructure layer this application belongs to |
| podAnnotations."tr8.io/platform" | string | `"automation"` | P of LPSD of Gotrade Service Tree |
| podAnnotations."tr8.io/service" | string | `"n8n"` | S of LPSD of Gotrade Service Tree |
| podAnnotations."tr8.io/team" | string | `"DevOps"` | Team in charge of this chart |
| podAnnotations."tr8.io/version" | string | `"1.0.0"` | Chart version |
| podLabels | object | `{"tr8.io/designation":"workflow-engine","tr8.io/landscape":"develop","tr8.io/layer":"2","tr8.io/platform":"automation","tr8.io/service":"n8n","tr8.io/team":"DevOps"}` | Pod labels |
| podLabels."tr8.io/designation" | string | `"workflow-engine"` | D of LPSD of Gotrade Service Tree |
| podLabels."tr8.io/landscape" | string | `"develop"` | L of LPSD of Gotrade Service Tree |
| podLabels."tr8.io/layer" | string | `"2"` | Infrastructure layer this application belongs to |
| podLabels."tr8.io/platform" | string | `"automation"` | P of LPSD of Gotrade Service Tree |
| podLabels."tr8.io/service" | string | `"n8n"` | S of LPSD of Gotrade Service Tree |
| podLabels."tr8.io/team" | string | `"DevOps"` | Team in charge of this chart |
| podSecurityContext | object | `{"fsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Pod security context |
| postgresql | object | `{"auth":{"database":"n8n","password":"changeme-n8n-postgres-password","username":"n8n"},"enabled":true,"primary":{"persistence":{"enabled":true,"size":"20Gi"},"resources":{"limits":{"cpu":"500m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"512Mi"}},"service":{"ports":{"postgresql":5432}}}}` | PostgreSQL configuration (subchart) |
| redis | object | `{"auth":{"enabled":true,"password":"changeme-n8n-redis-password"},"enabled":true,"master":{"persistence":{"enabled":true,"size":"8Gi"},"resources":{"limits":{"cpu":"250m","memory":"512Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}}}` | Redis configuration (subchart) - Optional but recommended for queue mode |
| replicaCount | int | `1` | Number of n8n replicas |
| resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"500m","memory":"1Gi"}}` | Resource limits and requests |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsNonRoot":true,"runAsUser":1000}` | Container security context |
| service | object | `{"annotations":{},"port":80,"type":"ClusterIP"}` | Service configuration |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Service account configuration |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. |
| tolerations | list | `[]` | Tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)