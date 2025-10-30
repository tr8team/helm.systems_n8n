# Gotrade n8n

A Helm chart for deploying self-hosted n8n workflow automation platform in Kubernetes clusters, specifically designed for Gotrade's infrastructure needs.

## Overview

This repository contains a Helm chart for deploying n8n, an open-source workflow automation tool that helps connect various apps and services. The chart includes PostgreSQL for data persistence and Redis for queue-based execution mode.

## Features

- Self-hosted n8n workflow automation platform
- PostgreSQL database for data persistence
- Redis for queue-based execution (optional)
- Persistent storage for workflows and credentials
- Ingress support with TLS
- Configurable resource limits and requests
- Support for multiple environments (staging, production)
- Integration with Gotrade's service tree (LPSD)
- Security-focused configuration with non-root user

## Prerequisites

- Kubernetes cluster 1.19+
- Helm 3.0+
- PV provisioner support in the underlying infrastructure
- Ingress controller (nginx recommended)
- cert-manager for TLS certificates (optional but recommended)

## Quick Start

### 1. Add Dependencies

```bash
helm dependency update chart/
```

### 2. Install for Staging

```bash
helm install n8n chart/ \
  --namespace n8n \
  --create-namespace \
  -f chart/values.stage.yaml \
  --set n8n.encryptionKey="$(openssl rand -hex 32)" \
  --set postgresql.auth.password="$(openssl rand -base64 32)" \
  --set redis.auth.password="$(openssl rand -base64 32)"
```

### 3. Install for Production (Indonesia)

```bash
helm install n8n chart/ \
  --namespace n8n \
  --create-namespace \
  -f chart/values.prod-indo.yaml \
  --set n8n.encryptionKey="$(openssl rand -hex 32)" \
  --set postgresql.auth.password="$(openssl rand -base64 32)" \
  --set redis.auth.password="$(openssl rand -base64 32)"
```

## Configuration

### Key Configuration Parameters

#### n8n Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `n8n.protocol` | Protocol (http or https) | `https` |
| `n8n.host` | Hostname for n8n | `n8n.example.com` |
| `n8n.webhookUrl` | Webhook URL | `https://n8n.example.com/` |
| `n8n.editorBaseUrl` | Editor base URL | `https://n8n.example.com/` |
| `n8n.timezone` | Timezone for n8n | `UTC` |
| `n8n.encryptionKey` | Encryption key for credentials | `changeme-generate-with-openssl-rand-hex-32` |

#### Database Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `postgresql.enabled` | Enable PostgreSQL subchart | `true` |
| `postgresql.auth.username` | PostgreSQL username | `n8n` |
| `postgresql.auth.password` | PostgreSQL password | `changeme-n8n-postgres-password` |
| `postgresql.auth.database` | PostgreSQL database name | `n8n` |
| `postgresql.primary.persistence.size` | PostgreSQL storage size | `20Gi` |

#### Redis Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `redis.enabled` | Enable Redis for queue mode | `true` |
| `redis.auth.enabled` | Enable Redis authentication | `true` |
| `redis.auth.password` | Redis password | `changeme-n8n-redis-password` |
| `redis.master.persistence.size` | Redis storage size | `8Gi` |

#### Persistence Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `persistence.enabled` | Enable persistence | `true` |
| `persistence.size` | Storage size for n8n data | `10Gi` |
| `persistence.storageClass` | Storage class | `""` |

#### Ingress Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `ingress.enabled` | Enable ingress | `false` |
| `ingress.className` | Ingress class name | `nginx` |
| `ingress.hosts[0].host` | Hostname | `n8n.example.com` |
| `ingress.tls[0].secretName` | TLS secret name | `n8n-tls` |

### Environment-Specific Values

The chart includes pre-configured values files for different environments:

- **values.stage.yaml**: Staging environment configuration
  - Host: `n8n.stage.tr8.io`
  - Timezone: `Asia/Singapore`
  - Resources: Medium (500m-1000m CPU, 1-2Gi memory)
  - Storage: 20Gi

- **values.prod-indo.yaml**: Production environment in Indonesia
  - Host: `n8n.prod.tr8.io`
  - Timezone: `Asia/Jakarta`
  - Resources: High (1000m-2000m CPU, 2-4Gi memory)
  - Storage: 50Gi
  - High availability with Redis replicas
  - Production-grade PostgreSQL configuration

## Security Considerations

### Encryption Key

The `n8n.encryptionKey` is critical for encrypting credentials stored in n8n. **ALWAYS** generate a new key for each environment:

```bash
openssl rand -hex 32
```

**Never commit the encryption key to version control.**

### Database Passwords

Always generate strong passwords for PostgreSQL and Redis:

```bash
# PostgreSQL password
openssl rand -base64 32

# Redis password
openssl rand -base64 32
```

### Non-Root User

The chart runs n8n as a non-root user (UID 1000) with appropriate security contexts to minimize attack surface.

## Upgrading

To upgrade the n8n deployment:

```bash
helm upgrade n8n chart/ \
  --namespace n8n \
  -f chart/values.stage.yaml \
  --reuse-values
```

## Uninstalling

To uninstall the n8n deployment:

```bash
helm uninstall n8n --namespace n8n
```

**Note**: This will not delete the PersistentVolumeClaims. To delete them:

```bash
kubectl delete pvc -n n8n --all
```

## Troubleshooting

### Check Pod Status

```bash
kubectl get pods -n n8n
```

### View Logs

```bash
# n8n logs
kubectl logs -n n8n -l app.kubernetes.io/name=n8n

# PostgreSQL logs
kubectl logs -n n8n -l app.kubernetes.io/name=postgresql

# Redis logs
kubectl logs -n n8n -l app.kubernetes.io/name=redis
```

### Access n8n Directly

```bash
kubectl port-forward -n n8n svc/n8n 8080:80
```

Then access http://localhost:8080

## Labels and Annotations

The chart automatically adds Gotrade's LPSD (Landscape, Platform, Service, Designation) labels and annotations:

- **Landscape**: Environment (develop, staging, prod-indo)
- **Platform**: automation
- **Service**: n8n
- **Designation**: workflow-engine
- **Layer**: 2
- **Team**: DevOps

## Architecture

```
┌─────────────┐
│   Ingress   │
└──────┬──────┘
       │
       ▼
┌─────────────┐     ┌──────────────┐     ┌─────────┐
│     n8n     │────▶│ PostgreSQL   │     │  Redis  │
│  Deployment │     │   Database   │     │  Queue  │
└─────────────┘     └──────────────┘     └─────────┘
       │                    │                   │
       ▼                    ▼                   ▼
┌─────────────┐     ┌──────────────┐     ┌─────────┐
│ Persistent  │     │ Persistent   │     │Persistent│
│   Volume    │     │   Volume     │     │ Volume  │
└─────────────┘     └──────────────┘     └─────────┘
```

## Support

For support, contact the DevOps team at devops@tr8.io

## License

This project is licensed under the terms included in the LICENSE file.
