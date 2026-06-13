# AWS EC2 Infrastructure with Terraform

This repository contains Terraform configurations for provisioning an Amazon EC2 instance and related IAM resources on AWS.

## Repository Structure

```text
.
├── ec2.tf
├── iam.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
└── variables.tf
```

## Files Description

| File               | Description                                           |
| ------------------ | ----------------------------------------------------- |
| `main.tf`          | Terraform provider configuration and common resources |
| `ec2.tf`           | Amazon EC2 instance configuration                     |
| `iam.tf`           | IAM Role, Policy, and Instance Profile configuration  |
| `variables.tf`     | Input variables used throughout the project           |
| `terraform.tfvars` | Environment-specific variable values                  |
| `outputs.tf`       | Terraform outputs                                     |

---

## Overview

This project provisions:

* Amazon EC2 Instance
* Security Groups
* IAM Role
* IAM Instance Profile
* EBS Storage (if configured)
* AWS Networking Components (if configured)

This repository is intended for:

```text
Development Environment
```

For production environments, additional security hardening and infrastructure controls should be implemented.

---

## Prerequisites

### Terraform

Required Version:

```text
Terraform >= 1.6
```

Verify:

```bash
terraform version
```

### AWS CLI

Verify:

```bash
aws --version
```

### Configure AWS Credentials

```bash
aws configure
```

Verify access:

```bash
aws sts get-caller-identity
```

---

## Configuration

Update values in:

```text
terraform.tfvars
```

Example:

```hcl
aws_region    = "ap-southeast-1"
instance_name = "dev-server"
instance_type = "t3.micro"
ec2_key_name = "Existing AWS Key Pair name used for SSH access"
ec2_public_key = "SSH public key used for EC2 access"
allowed_ssh_cidr = "CIDR block allowed to connect via SSH YOUR_PUBLIC_IP/32"
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Format Terraform Code

```bash
terraform fmt -recursive
```

---

## Review Planned Changes

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

Approve the deployment:

```text
yes
```

---

## Verify Created Resources

View outputs:

```bash
terraform output
```

List managed resources:

```bash
terraform state list
```

Show infrastructure details:

```bash
terraform show
```

---

## Connect to EC2 Instance

Example:

```bash
ssh -i my-key.pem ec2-user@<public-ip>
```

or

```bash
ssh -i my-key.pem ubuntu@<public-ip>
```

depending on the selected AMI.

---

## Destroy Infrastructure

```bash
terraform destroy
```

Approve:

```text
yes
```

---

## Remote Backend (Recommended)

For team collaboration and production usage, store Terraform state remotely using Amazon S3 and DynamoDB.

Example:

```hcl
terraform {
  backend "s3" {
    bucket         = "hudai-terraform-state"
    key            = "dev/ec2/web-srv01.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

---

## Best Practices

* Never commit AWS credentials to Git.
* Do not commit sensitive `.tfvars` files containing secrets.
* Review `terraform plan` before every deployment.
* Use remote state storage for team environments.
* Follow the principle of least privilege for IAM resources.
* Use separate environments for development and production.

---

## Useful Commands

```bash
terraform init
terraform validate
terraform fmt -recursive
terraform plan
terraform apply
terraform destroy
terraform show
terraform output
terraform state list
```

---

## License

This project is intended for learning, development, and educational purposes.
