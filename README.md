highly available and secure DevOps project featuring an automated web server and a private monitoring stack.

## 🏗 Architecture
The project is hosted on AWS with a hybrid public/private network design.
* **Web Server**: Publicly accessible via `web.dineshvar.com` (Cloudflare DNS).
* **Monitoring Stack**: Hosted in a private subnet, accessible only via a secure Cloudflare Tunnel at `monitoring.dineshvar.com`.



## 🛠 Tech Stack
- **Cloud**: AWS (EC2, VPC, ECR)
- **Configuration Management**: Ansible
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **Monitoring**: Prometheus & Grafana
- **Security**: Cloudflare Zero Trust (Tunneling)

## 🚀 Deployment Instructions
1. **Terraform**: `terraform apply` to provision the VPC and EC2 instances.
2. **Ansible**: 
   - Run `setup_webserver.yml` to deploy the app.
   - Run `setup_monitoring.yml` to deploy Prometheus and Grafana.
   - Run `setup_tunnel.yml` to establish the Cloudflare link.
