# rsschool-devops-course-tasks

This repository contains solutions for the [RS School DevOps Course](https://github.com/rolling-scopes-school/tasks/tree/master/devops/modules/1_basic-configuration) tasks. The current implementation covers **Task 1: Basic Configuration**.

## Task Description

Implements basic AWS infrastructure configuration using Terraform, including:

- S3 backend configuration for remote state storage
- IAM OIDC provider setup
- IAM role creation
- Example S3 bucket resource

Task details: [Task 1 - Basic Configuration](https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_1.md)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.12.2
- AWS CLI configured with appropriate credentials

## Usage

1. **Clone the repository:**

   ```bash

   git clone <repo-url>
   cd rsschool-devops-course-tasks
   ```

2. **Initialize Terraform:**

   ```bash

   terraform init
   ```

3. **Review the execution plan:**

   ```bash

   terraform plan
   ```

4. **Apply the configuration:**

   ```bash

   terraform apply
   ```

## Configuration

- The backend is configured to use an S3 bucket (`rsschool-terraform-state-storage`) in the `ap-northeast-1` region for state storage.
- Variables can be set in `variable.tf` or via CLI/environment variables.

## Files

- `backend.tf` — S3 backend configuration
- `main.tf` — Main Terraform resources
- `iam-oidc.tf` — IAM OIDC provider
- `iam-role.tf` — IAM role definition
- `test-bucket.tf` — Example S3 bucket
- `variable.tf` — Input variables

## Notes

- Ensure you have access to the specified S3 bucket and region.
- Review and update variables as needed for your environment.

---

For more details, refer to the [official task description](https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_1.md).

# Task 2

# AWS VPC Infrastructure with Terraform (Task 2)

This repository contains Terraform code to provision a secure and scalable AWS VPC infrastructure.

## Architecture Overview

The infrastructure includes:

- A custom VPC with a specified CIDR block.
- Two public subnets, each in a different Availability Zone (AZ).
- Two private subnets, each in a different Availability Zone (AZ).
- An Internet Gateway for internet connectivity to the public subnets.
- Configured route tables to allow:
  - Instances in all subnets to reach each other.
  - Instances in public subnets to reach the internet and vice-versa.
- Security Groups for:
  - Bastion Host (SSH access from a specific IP).
  - Private Instances (SSH from Bastion, intra-VPC communication).
  - Public Instances (HTTP, HTTPS, SSH, intra-VPC communication).
- A Bastion Host in a public subnet for secure SSH access to private instances.
- NAT Gateway (or NAT Instance) in a public subnet to allow instances in private subnets to initiate outbound connections to the internet.

## Prerequisites

- AWS account with programmatic access keys configured.
- AWS CLI installed and configured.
- Terraform installed (v1.0.0 or higher recommended).
- An existing EC2 Key Pair in your AWS region for SSH access. (Update `variables.tf` with its name).

## Usage

1.  **Clone the repository:**

    ```bash
    git clone <your-repo-url>
    cd aws-devops-task2
    ```

2.  **Update `variables.tf`:**
    Open `variables.tf` and update `key_pair_name` with the name of your existing EC2 key pair and `my_public_ip_cidr` with your current public IP address (e.g., `X.X.X.X/32`).

3.  **Initialize Terraform:**

    ```bash
    terraform init
    ```

4.  **Review the plan:**

    ```bash
    terraform plan
    ```

    Carefully review the proposed changes.

5.  **Apply the configuration:**

    ```bash
    terraform apply --auto-approve
    ```

    This will provision all the AWS resources.

6.  **Accessing Private Instances via Bastion Host:**

    - Get the public IP of the Bastion Host from `terraform output bastion_public_ip`.
    - To connect to a private instance, you will first SSH into the bastion host:
      ```bash
      ssh -i /path/to/your/key.pem ec2-user@<Bastion_Public_IP>
      ```
    - From the bastion host, you can then SSH into your private instances (assuming your `key.pem` is forwarded or present on the bastion, or use SSH agent forwarding):
      ```bash
      ssh -i /path/to/your/key.pem ec2-user@<Private_Instance_IP>
      ```
      (Replace `ec2-user` with the correct username for your AMI if different).

7.  **Destroying Resources:**
    To avoid incurring unnecessary costs, destroy the resources when you are finished:
    ```bash
    terraform destroy --auto-approve
    ```

## Resource Map Screenshot

A screenshot of the AWS VPC Resource Map will be provided in the Pull Request description.

## GitHub Actions (Optional)

[If you implement GHA, describe it here. Example:
A GitHub Actions workflow is configured to automatically run `terraform validate` and `terraform plan` on every pull request to ensure code quality and show planned changes.]
