# 🛡️ Trust Me, I’m a DevOps Engineer
**End-to-End Automated AWS Infrastructure & CI/CD Pipeline**

[![Documentation](https://img.shields.io/badge/Docs-GitHub_Pages-blue)](https://dinesh9710.github.io/devops-bootcamp-project/)
[![Infrastructure](https://img.shields.io/badge/IaC-Terraform-9b51e0)](./terraform)
[![Configuration](https://img.shields.io/badge/Config-Ansible-ee0000)](./ansible)

## 📖 Project Overview
This project showcases a professional-grade DevOps workflow. I have moved away from manual "click-ops" to a fully automated **Infrastructure as Code (IaC)** model. The architecture is provisioned on AWS using Terraform, configured with Ansible, and maintained through a custom GitHub Actions CI/CD pipeline.

### **Quick Links**
* **🌐 Live Web App:** [http://web.dineshvar.com](http://web.dineshvar.com)
* **📊 Monitoring Dashboard:** [https://monitoring.dineshvar.com](https://monitoring.dineshvar.com) (Protected via Cloudflare Tunnel)
* **📄 Project Documentation:** [GitHub Pages Link](https://dinesh9710.github.io/devops-bootcamp-project/)

---

## 🏗️ Architecture & Security


* **VPC Design:** A custom VPC (10.0.0.0/24) with isolated public and private subnets.
* **Zero-SSH Policy:** No port 22 is open to the public. Management is handled securely via **AWS Systems Manager (SSM)**.
* **Networking:** Cloudflare Tunnels are used to expose the internal monitoring stack without requiring public IP addresses or open inbound ports.

---

## ⚙️ Automation Stack

### **1. Infrastructure (Terraform)**
I used Terraform to define and provision the entire AWS environment, including:
* VPC, Subnets, and Route Tables.
* Security Groups with "Least Privilege" rules.
* EC2 Instances for Web Hosting and Monitoring.

### **2. Configuration (Ansible)**
Playbooks were used to transform raw EC2 instances into functional servers:
* `install_docker.yml`: Sets up the official Docker engine and dependencies.
* `setup_monitoring.yml`: Deploys the Prometheus and Grafana stack via Docker Compose.
* `setup_tunnel.yml`: Configures the Cloudflare Tunnel for secure remote access.

---

## 🚀 CI/CD Pipeline (Automated Build & Deploy)
The project features a full **GitHub Actions** pipeline that automates the application lifecycle:
1.  **Build:** On every push to `main`, a new Docker image is created.
2.  **Push:** The image is securely uploaded to **Amazon ECR**.
3.  **Deploy:** The pipeline uses **AWS SSM** to command the Web Server to pull the latest image and restart the container—ensuring a seamless, automated update process.

---

## 📈 Monitoring & Reliability
As an SRE-focused project, visibility is key:
* **Prometheus:** Scrapes system metrics (CPU, RAM, Disk) from the Web Server.
* **Grafana:** Visualizes health data in real-time dashboards to identify performance bottlenecks.

---
