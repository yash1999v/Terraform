# Terraform Setup Guide

## 1. Install Terraform

Official Documentation:  
[https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)

---

## Providers Reference

- [Terraform Registry - Providers](https://registry.terraform.io/namespaces/hashicorp)  
- [Local Provider - local_file Resource](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)

---

## Commands to Install Terraform on Linux

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform


# Terraform Setup Guide

## 1. Install Terraform

Official Documentation:  
[https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)

---

## Providers Reference

- [Terraform Registry - Providers](https://registry.terraform.io/namespaces/hashicorp)  
- [Local Provider - local_file Resource](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)

---

## Commands to Install Terraform on Linux

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

---

## 🚨 Challenges Without Terraform

- ❌ Inconsistent environments  
- ⏱️ Manual, time-consuming provisioning  
- 🤯 Difficult to track infrastructure changes  
- 🧪 Error-prone deployments  
- 📄 No proper documentation of infra  
- 🔄 Hard to replicate or rollback infra  
- 🔐 Security misconfigurations likely  

---

## ✅ What Terraform Helps Wih

- 📦 Define infrastructure as code (IaC)  
- 🔁 Consistent and repeatable deployments  
- 📝 Store config in Git with version control  
- ⚙️ Automate infra provisioning  
- 🚀 Rapid environment setup  
- 🔄 Use reusable modules for DRY code  
- 🧪 Preview infra changes with `terraform plan`  
- 🌐 Support for AWS, Azure, GCP, and more  
- 🔐 Manage security settings declaratively  
- 🧯 Easy recovery and replication  

---

## HCL Basics & Creating First Resource

- **HCL Structure**: HashiCorp Configuration Language (HCL) uses **blocks** defined with curly braces `{}` and **arguments** written as key-value pairs.
  
- **Resource Block**: A fundamental block in Terraform used to define infrastructure. It follows the format:  
  `resource "<provider>_<type>" "<name>" { ... }`

- **Provider and Resource Type**: In `resource "local_file" "pet"`,  
  - `local` is the provider  
  - `file` is the resource type  
  - `pet` is the logical name

- **Arguments**: Each resource has required and optional arguments. For `local_file`, `filename` and `content` are required arguments.

- **Terraform Commands Workflow**:
  1. `terraform init` – Initializes the project and downloads necessary provider plugins.  
  2. `terraform plan` – Previews the actions Terraform will take.  
  3. `terraform apply` – Executes the changes and creates resources.

- **Documentation Is Key**: Always refer to [Terraform Registry](https://registry.terraform.io) to check available resource types and their expected arguments per provider.

