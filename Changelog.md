## 1.0.0 (2026-08-24)


### New Features

* add ALB Ingress for nginx ingress flow ([65ee186](https://github.com/tr8team/helm.systems_n8n/commit/65ee1862199cc66c95a0bba7d95fd52ddc1f7d9a))
* add n8n worker deployment for queue mode processing ([09fc0c3](https://github.com/tr8team/helm.systems_n8n/commit/09fc0c34b6011d0be2b9b94f96fd501b582014fc))
* add nix flakes support for modern nix workflow ([6f05612](https://github.com/tr8team/helm.systems_n8n/commit/6f056128be06d606b030cde432c47600090d7ec5))
* add values.indo.yaml for prod-indo environment ([20d98c9](https://github.com/tr8team/helm.systems_n8n/commit/20d98c9d89444abc1549eaa6d06636b3b0676bc2))
* disable ingress ([e2fe1f1](https://github.com/tr8team/helm.systems_n8n/commit/e2fe1f157bdae05f51cd3a4bcb2a250f55cbdd63))
* enable Redis with IPv6 support for indo environment ([f821eb4](https://github.com/tr8team/helm.systems_n8n/commit/f821eb42e56450c4534d6af1851c5f115b8ea88e))
* initial helm chart for self-hosted n8n ([cd53198](https://github.com/tr8team/helm.systems_n8n/commit/cd531986e415e9cfb9a1689ed1a397c74daf4884))
* update ingress to use AWS ALB with correct URLs ([a5eb608](https://github.com/tr8team/helm.systems_n8n/commit/a5eb608f0bdcb31920123e54787967b4939460b2))


### Bug Fixes

* add NODE_OPTIONS to prefer IPv4 over IPv6 ([c9006e2](https://github.com/tr8team/helm.systems_n8n/commit/c9006e23744ce33ceabb9a657267022fefadf467))
* configure Redis and PostgreSQL services with dual-stack ([2490e6c](https://github.com/tr8team/helm.systems_n8n/commit/2490e6c360a87a8a71d752c6b06d44843df064bb))
* disable Redis for IPv6-only cluster compatibility ([667d45f](https://github.com/tr8team/helm.systems_n8n/commit/667d45fcf25af71175e2ca0904c08f84cdfb41c5))
* **ci:** freeze sg-release toolchain to node18-compatible SR22-era set ([#4](https://github.com/tr8team/helm.systems_n8n/issues/4)) ([f617985](https://github.com/tr8team/helm.systems_n8n/commit/f61798521dc4b001e005d8e00ecec80677a8bc9e))
* increase probe delays for database migration ([66112d4](https://github.com/tr8team/helm.systems_n8n/commit/66112d4cd7497355fe8741a6183df56dafe57366))
* **ci:** only rewrite yarn add args in the release shim, pass exec through ([#5](https://github.com/tr8team/helm.systems_n8n/issues/5)) ([553a35e](https://github.com/tr8team/helm.systems_n8n/commit/553a35ea0d365fb5f8d866479c52ee0c7f02107b))
* pre-commit ([9e09c19](https://github.com/tr8team/helm.systems_n8n/commit/9e09c19600359bcdc41f2b1a17ca5e33fc5fa965))
* **config:** remove pls setup from .envrc ([490c969](https://github.com/tr8team/helm.systems_n8n/commit/490c96927e98ee6f1e28104bf8b0f10372af0787))
* **ci:** replace dead nix-shell shebang in publish.sh with bash ([#6](https://github.com/tr8team/helm.systems_n8n/issues/6)) ([3ed835c](https://github.com/tr8team/helm.systems_n8n/commit/3ed835cc76efd89000c2222957b028ac2be06161))
* replace symlink, set serviceAccount and use nginx ingress ([36e6c11](https://github.com/tr8team/helm.systems_n8n/commit/36e6c11e6a540b49e3b0cfeb12c0171e6375543b))
* set N8N_LISTEN_ADDRESS to :: for IPv6-only cluster ([468ae44](https://github.com/tr8team/helm.systems_n8n/commit/468ae44019a97ecafcb48769265da8aa44491ed4))
* **ci:** simplify pre-commit script to match gotradeindo pattern ([a3f08ea](https://github.com/tr8team/helm.systems_n8n/commit/a3f08ea76a9a1cdca3ae68f0dafacd79abd8dcc9))
* **ci:** simplify release script to match gotradeindo pattern ([a5878e4](https://github.com/tr8team/helm.systems_n8n/commit/a5878e4fdc62abc6ba20047afe7f3a016613ac89))
* update bitnami chart dependencies to latest versions ([243db1a](https://github.com/tr8team/helm.systems_n8n/commit/243db1abfc4119d5604c99908a1cdd4038699458))
* use FQDN for database and redis host connections ([e12524d](https://github.com/tr8team/helm.systems_n8n/commit/e12524de9f630c66a09b82c63f0306615d1891bd))
* **ci:** use nix develop instead of nix-shell for flakes ([37debcf](https://github.com/tr8team/helm.systems_n8n/commit/37debcfca8cadad2a4783ba0edda57d363ab7fd5))
* **ci:** use nix-generated pre-commit config and apply formatting ([6218a53](https://github.com/tr8team/helm.systems_n8n/commit/6218a539251afde160a44e285e33dd8e6d5cdfdc))

# Changelog

All notable changes to this project will be documented in this file. See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 1.0.0 (2025-10-30)

### New Features

- Initial Helm chart for self-hosted n8n workflow automation
- PostgreSQL v16.5.2 integration for data persistence
- Redis v20.6.0 integration for queue mode
- Kubernetes deployment with security contexts
- Persistent storage configuration
- Ingress support with TLS
- Environment-specific values files (staging and production)
- LPSD labels for Gotrade service tree integration
