variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-northeast-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0bb2c57f7cfafb1cb"
}

variable "instance_type" {
  description = "Instance type for the bastion host and potential other instances."
  type        = string
  default     = "t2.micro"
}

variable "instance_type_k3s" {
  description = "Instance type for the k3s nodes."
  type        = string
  default     = "t2.small"
}

variable "key_pair_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "rss-aws-devops"
}

variable "my_public_ip_cidr" {
  description = "Your public IP address in CIDR notation for SSH access"
  type        = string
  default     = "213.230.74.123/32"
}

variable "github_actions_role_name" {
  description = "Name of the IAM role GitHub Actions will assume"
  type        = string
  default     = "GithubActionsRole"
}
