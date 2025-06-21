variable "github_actions_role_name" {
  description = "Name of the IAM role GitHub Actions will assume"
  type        = string
  default     = "GithubActionsRole"
}