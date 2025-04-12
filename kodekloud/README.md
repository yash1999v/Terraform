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

## Terraform Quick Reference for Updates & Destruction

### Updating Resources:
- Modify the configuration (e.g., change file permissions).
- Run `terraform plan` to see the change.
- If the resource will be replaced, it will be deleted and recreated (immutable infrastructure).

### Applying Changes:
- Use `terraform apply` and confirm with "yes" to apply changes and recreate the resource.

### Destroying Resources:
- Run `terraform destroy` to delete the infrastructure.
- Confirm with "yes" to proceed.

## Terraform Quick Reference for Providers

### Terraform Providers Overview:
- Terraform uses a plugin-based architecture to work with various infrastructure platforms (e.g., AWS, GCP, Azure, Local).
- Providers are categorized into:
  - **Official Providers**: Maintained by HashiCorp (e.g., AWS, GCP, Azure, Local).
  - **Partner Providers**: Maintained by third-party tech companies (e.g., Big IP, Heroku, DigitalOcean).
  - **Community Providers**: Maintained by individual contributors.

### Terraform Initialization (`terraform init`):
- The `terraform init` command initializes the working directory and downloads necessary provider plugins.
- The plugins are installed in the `.terraform/plugins` directory.
- The provider name (e.g., `hashicorp/local`) is known as the **source address** and is used to locate and download the plugin.
- The format of the source address: `registry.terraform.io/<org>/<provider>`, e.g., `registry.terraform.io/hashicorp/local`.
  
### Provider Versioning:
- Terraform installs the latest version of the provider by default.
- To prevent breaking changes from updates, you can lock the configuration to a specific version of the provider.

## Terraform Quick Reference for Configuration Directories & Naming Conventions

### Configuration Directory:
- Terraform allows multiple configuration files within the same directory.
- All files with the `.tf` extension in the directory are considered part of the configuration.

### Common File Naming Conventions:
- **`main.tf`**: Typically used for the primary configuration file containing all resource blocks.
- **`variables.tf`**: Used to define input variables for the Terraform configuration.
- **`outputs.tf`**: Used to define output variables to be displayed after Terraform applies the configuration.
- **`providers.tf`**: Used to define provider configurations.
- **Other Files**: Additional `.tf` files can be created to organize resources and configurations logically (e.g., `cad.tf`).

### Example:
- **`local.tf`**: Resource configuration for creating a local file.
- **`cad.tf`**: Another configuration file that uses the same local file resource to create a new file.

This setup allows for better organization and separation of different parts of the Terraform configuration.

## Terraform Quick Reference for Multiple Providers & Resources

### Overview:
In Terraform, we can use multiple providers in a single configuration. This allows you to manage resources across different platforms or services. In this example, we will use:
- **Local provider**: For managing local resources (e.g., files).
- **Random provider**: For creating random resources (e.g., random pet names).

### Steps to Use Multiple Providers:

#### 1. **Defining Multiple Providers in the Configuration**

You can use different providers in your `main.tf` file. In this case, we will add a resource using the **random** provider for generating a random pet name.

##### Code Snippet: Defining the Random Pet Resource

##### Using the local provider
`resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello from Terraform!"
}`

##### Using the random provider
`resource "random_pet" "my_pet" {
  prefix    = "My"
  separator = "-"
  length    = 2`
}

# 🌱 Terraform Variable Types - Deep Dive

Welcome to this Terraform project that explores different types of variables in Terraform, from basic to complex structures.

## 📌 Overview

This repository is a hands-on guide for understanding how to define and use variables effectively in Terraform. You’ll learn how to use basic types like `string`, `number`, and `bool`, as well as complex types like `list`, `map`, `set`, `object`, and `tuple`.

---

## 📘 Variable Types Covered

### ✅ Basic Types
- **String** – For alphanumeric values.
- **Number** – For integers and decimals.
- **Boolean** – For true/false values.

### 🧩 Complex Types
- **List** – An ordered collection accessed by index.
- **Map** – Key-value pairs.
- **Set** – An unordered collection of unique values.
- **Object** – A structured collection of fields with defined types.
- **Tuple** – A sequence of values with fixed length and type order.

---

## 🛠️ Sample Snippets

### 🎯 String Variable
```hcl
variable "region" {
  type    = string
  default = "us-west-1"
}
```

### 🎯 List Variable
`hcl
Copy
Edit
variable "prefixes" {
  type    = list(string)
  default = ["Mr", "Mrs", "Sir"]
}`
### 🎯 Map Variable
hcl
Copy
Edit
variable "file_content" {
  type = map(string)
  default = {
    statement1 = "Welcome"
    statement2 = "Hello from Terraform"
  }
}
### 🎯 Object Variable
`
hcl
Copy
Edit
variable "bella" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(string)
    favorite_pet = bool
  })
  default = {
    name         = "Bella"
    color        = "Brown"
    age          = 7
    food         = ["Fish", "Chicken", "Turkey"]
    favorite_pet = true
  }
}```