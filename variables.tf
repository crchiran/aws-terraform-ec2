variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "hudai-vpc"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "hudai-production-vpc"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnet_cidrs_block" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs_block" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "Allowed public IP for SSH access"
  type        = string
}

variable "http_allowed_cidrs" {
  description = "Allowed CIDR blocks for HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_allowed_cidrs" {
  description = "Allowed CIDR blocks for HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "internet_gateway_name" {
  description = "Internet gateway name"
  type        = string
  default     = "hudai-production-igw"
}

variable "public_route_table_name" {
  description = "Public route table name"
  type        = string
  default     = "hudai-production-public-rt"
}

variable "s3_endpoint_name" {
  description = "S3 Gateway Endpoint name"
  type        = string
  default     = "hudai-production-s3-endpoint"
}

variable "ec2_key_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "hudai-production-ec2-key"
}

variable "ec2_public_key" {
  description = "SSH public key content"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "hudai-server-01"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 20
}

variable "disable_api_termination" {
  description = "Enable EC2 termination protection"
  type        = bool
  default     = false
}
