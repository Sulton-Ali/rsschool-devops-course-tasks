data "aws_iam_policy_document" "assume_iodc" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:Sulton-Ali/rsschool-devops-course-tasks:*"]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "GithubActionsRole"
  assume_role_policy = data.aws_iam_policy_document.assume_iodc.json
}

resource "aws_iam_role_policy_attachment" "policies" {
  for_each = toset([
    "AmazonEC2FullAccess",
    "AmazonRoute53FullAccess",
    "AmazonS3FullAccess",
    "IAMFullAccess",
    "AmazonVPCFullAccess",
    "AmazonSQSFullAccess",
    "AmazonEventBridgeFullAccess",
  ])
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/${each.key}"

}
