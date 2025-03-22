resource "aws_iam_user" "colosseum_github_ci" {
  name = "colosseum-github-ci"
  path = "/"

  tags = {
    Description = "User for GitHub CI to access S3 terraform state"
    Project     = "colosseum"
  }
}

resource "aws_iam_policy" "terraform_state_access" {
  name        = "colosseum-terraform-state-access"
  description = "Policy for access to Colosseum terraform state bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "TerraformStateReadWrite",
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Resource = [
          "arn:aws:s3:::colosseum-terraform-state",
          "arn:aws:s3:::colosseum-terraform-state/*"
        ]
      },
      {
        Sid    = "IAMSelfManagement",
        Effect = "Allow",
        Action = [
          "iam:GetPolicy",
          "iam:GetUser",
          "iam:GetUserPolicy",
          "iam:ListAttachedUserPolicies",
          "iam:ListUserPolicies"
        ],
        Resource = [
          "arn:aws:iam::545389514010:user/colosseum-github-ci",
          "arn:aws:iam::545389514010:policy/colosseum-terraform-state-access"
        ]
      },
      {
        Sid    = "IAMReadAccess",
        Effect = "Allow",
        Action = [
          "iam:ListUsers",
          "iam:ListPolicies"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "colosseum_github_ci_policy" {
  user       = aws_iam_user.colosseum_github_ci.name
  policy_arn = aws_iam_policy.terraform_state_access.arn
}
