Terraform:

### JSON & YAML for CFT , infr as code
AWS - CFT
Azure -Resource Manager 
Open stalk - Haet manager


But Tearraform helps with combining different providers
WITH Hashicorp language - "HCL" (API as code)
compititor - Crossplane 
API as code converts one provider code to other 

Installation :
Go to official select OS and download	

First HCL snippet for EC2 insatnce creation 
1. Once AWS cli configured with : cmd: aws configure
2. create a .tf file in a folder 
3. SNippet 
```

provider "aws"{
    region = "us-east-1"
}
resource "aws_instance" "example" {
    ami= "ami-07a6f770277670015"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-01643a98d8b0cbd9b"]
    key_name = "all"
    tags = {
        Name = "example-instance"
    }
}
```
4. terraform validate, init, plan and apply and destroy finally to terminate the EC2 instance

==================================================

### conditional Expression, functions, providers

provider block check the provider and acts as plugin for terraform to mention the provider
offical , partner and community  - aws 
offcial - Terraform maintains  	 - alibaba
partner - both maintain 
comm - open  source , no backup in hashicorp

What to do if multi region is required with variables
Snippet 
```
main.tf
provider "aws" {
  region = var.aws_region1
  alias  = "us-east-1"
}
provider "aws" {
  region = var.aws_region2
  alias  = "us-west-2"
}

resource "aws_instance" "example1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  tags = {
    Name = "example-instance"
  }
  provider = aws.us-east-1
}
resource "aws_instance" "example2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  tags = {
    Name = "example-instance2"
  }
  provider = aws.us-west-2
}
output "instance_id" {
  value = aws_instance.example1.id
}
output "instance_id2" {
  value = aws_instance.example2.id
}
output "instance_public_ip" {
  value = aws_instance.example1.public_ip
}
output "instance_public_ip2" {
  value = aws_instance.example2.public_ip
}
```
```
variable.tf
variable "aws_region1" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
variable "aws_region2" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}
variable "ami" {
  description = "AMI ID to use for the instance"
  type        = string
  default     = "ami-07a6f770277670015"
}
variable "instance_type" {
  description = "Instance type to use for the instance"
  type        = string
  default     = "t2.micro"
}
variable "vpc_security_group_ids" {
  description = "VPC security group IDs to associate with the instance"
  type        = list(string)
  default     = ["sg-01643a98d8b0cbd9b"]
}
variable "key_name" {
  description = "Key name to use for the instance"
  type        = string
  default     = "all"
}
variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default = {
    Name = "example-instance"
  }
}
```

file structure 
-main
	-provider
	-input
	-output
	-terraform.tfvars  //all teams can ubdate here to reuse
	-dev.tfvars //terraform apply dev.tfvars

## Conditional expressions:
condition  ? true_value : false_value
ex: 
cidr_block= var.environment == "production" ? [var.production_subnet_cidr] : [var.development_subnet_cidr]

Builtin functions:
concat(list1, list2, ...)
element(list, index)
length(list)
map(key, value)



Day 3 : Modules
challenges - if monolithic so difficult to debug, test , ownership,maintainance
so its micro architectured

its called modules in terraform , we can converst heavy architecture to micro by modules



Day 4
Terraform State file :

Stores the state created by config folder.
what happens if no state file:
Tough to modify as no data persists.so state file is heart and single source of truth.

Disadvantages of state file:
sensitive is being recorded ,irrespective of knowledge.
	- even if its tracked , state file should not be available
	- if used by cloning , if config is not tested its brings diff b/w file and infra running as latest state file is not tracked (if not pushed after checks out)

These are drawbacks can be fixed by Terraform backend, can be stored on S3 instead of Local machine
	- so unnecessary access to S3 bucket can be restricted
	- auto updating of state file whenever apply is completed
	- with a new init , terraform understand backend S3 is utilized

Lets say:
We had 5-6 people in devops
had GitHub for EKS or VPC 3 tier architecture 
	-they clone
	-make changes and apply
	-PR back to GitHub
	-approved
	-S3 is auto updated with state file 
	-with changes
and state file locking by Dynamo DB

Terraform backend to address these challenge 
by using backend.tf
