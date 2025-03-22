# IAM user for GitHub CI
resource "aws_iam_user" "colosseum_github_ci" {
  name = "colosseum-github-ci"
  path = "/"

  tags = {
    Description = "User for GitHub CI to access S3 terraform state"
    Project     = "colosseum"
  }
}

# Access key for the GitHub CI user
resource "aws_iam_access_key" "colosseum_github_ci_key" {
  user = aws_iam_user.colosseum_github_ci.name
}

# IAM policy document for S3 bucket access
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

# IAM policy for terraform state access
resource "aws_iam_policy" "terraform_state_access" {
  name        = "colosseum-terraform-state-access"
  description = "Policy for access to Colosseum terraform state bucket"
  policy      = data.aws_iam_policy_document.terraform_state_access.json
}

# Attach policy to the GitHub CI user
resource "aws_iam_user_policy_attachment" "colosseum_github_ci_policy" {
  user       = aws_iam_user.colosseum_github_ci.name
  policy_arn = aws_iam_policy.terraform_state_access.arn
}

# Output the access key ID (the secret will be available in the state file)
output "colosseum_github_ci_access_key_id" {
  value = aws_iam_access_key.colosseum_github_ci_key.id
}

# This is sensitive and will be displayed only once after apply
output "colosseum_github_ci_secret_key" {
  value     = aws_iam_access_key.colosseum_github_ci_key.secret
  sensitive = true
}
