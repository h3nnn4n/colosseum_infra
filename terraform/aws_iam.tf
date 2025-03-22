# IAM user for GitHub CI
resource "aws_iam_user" "colosseum_github_ci" {
  name = "colosseum-github-ci"
  path = "/"

  tags = {
    Description = "User for GitHub CI to access S3 terraform state"
    Project     = "colosseum"
  }
}

data "aws_iam_policy_document" "terraform_state_access" {
  statement {
    sid    = "TerraformStateReadWrite"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
      "s3:DeleteObject"
    ]

    resources = [
      "arn:aws:s3:::colosseum-terraform-state",
      "arn:aws:s3:::colosseum-terraform-state/*"
    ]
  }
}

resource "aws_iam_policy" "terraform_state_access" {
  name        = "colosseum-terraform-state-access"
  description = "Policy for access to Colosseum terraform state bucket"
  policy      = data.aws_iam_policy_document.terraform_state_access.json
}

resource "aws_iam_user_policy_attachment" "colosseum_github_ci_policy" {
  user       = aws_iam_user.colosseum_github_ci.name
  policy_arn = aws_iam_policy.terraform_state_access.arn
}
