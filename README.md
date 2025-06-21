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
