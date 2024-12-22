# AWS Provider Region
variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  default     = "us-west-2"
}

# AMI ID
variable "ami_id" {
  description = "The Amazon Machine Image (AMI) ID for EC2 instances"
  default     = "ami-061dd8b45bc7deb3d"
}

# EC2 Instance Type
variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

# VPC Configuration
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "192.168.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default     = "Andre_VPC"
}

# Subnet CIDR Blocks
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["192.168.192.0/20", "192.168.208.0/20"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["192.168.224.0/20", "192.168.240.0/20"]
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  default     = "arn:aws:acm:us-west-2:576308171549:certificate/f47e23a3-5787-47aa-ae18-3a6de52f11ab" # Replace with your actual ARN
}