# Terraform AWS Infrastructure Setup

This project contains Terraform code to set up a secure, scalable, and highly available infrastructure on AWS. It includes the following components:

## Components

### 1. **Provider Configuration**
- Configures the AWS provider using a specified region (`var.aws_region`).

### 2. **VPC**
- Creates a Virtual Private Cloud (VPC) with DNS support and hostnames enabled.
- CIDR block and name are customizable via variables.

### 3. **Subnets**
- Public and private subnets are created across available Availability Zones.
- CIDR blocks for subnets are defined via variables.

### 4. **Internet Gateway**
- Adds an Internet Gateway to enable internet access for public subnets.

### 5. **Route Tables**
- Creates a public route table and associates it with the public subnets.
- Configures a route to allow public internet access.

### 6. **Launch Template**
- Sets up a launch template for EC2 instances, including:
  - AMI ID and instance type from variables.
  - User data script for initialization.
  - Security group association.

### 7. **Auto Scaling Group**
- Configures an Auto Scaling Group to maintain a desired number of EC2 instances (min: 2, max: 4).
- Associates instances with the public subnets and a target group.

### 8. **Load Balancer**
- Creates an Application Load Balancer (ALB) to distribute traffic.
- Listens on HTTPS (port 443) with an SSL certificate.
- Forwards traffic to an EC2 target group.

### 9. **Target Group**
- Sets up a target group to route traffic from the ALB to EC2 instances.

### 10. **Security Groups**
- **ALB Security Group**:
  - Allows inbound traffic on port 443 (HTTPS).
  - Allows all outbound traffic.
- **EC2 Security Group**:
  - Allows inbound traffic on port 80 (HTTP).
  - Allows all outbound traffic.
- **Security Group Rule**:
  - Allows ALB to communicate with EC2 instances on port 80.

### 11. **Outputs**
- Optionally outputs IDs for debugging (commented out).

## Prerequisites
1. Install Terraform.
2. Configure AWS CLI with appropriate credentials.
3. Provide the following variables:
   - `aws_region`: AWS region for resources.
   - `vpc_cidr_block`: CIDR block for the VPC.
   - `vpc_name`: Name of the VPC.
   - `public_subnet_cidrs`: CIDR blocks for public subnets.
   - `private_subnet_cidrs`: CIDR blocks for private subnets.
   - `instance_type`: EC2 instance type (e.g., `t2.micro`).
   - `ami_id`: AMI ID for the EC2 instances.
   - `certificate_arn`: ARN of the SSL certificate for the ALB.

## Usage
1. Clone this repository.
2. Initialize Terraform:
   ```bash
   terraform init
