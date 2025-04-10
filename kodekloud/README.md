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

