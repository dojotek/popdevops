resource "aws_iam_policy" "codebuild_policy" {
  name = "${var.infra_name}-codebuild-policy"
  path = "/"
  description = var.purpose

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "codebuild_service_role" {
  name = "${var.infra_name}-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "codebuild.amazonaws.com"
        Action = "sts:AssumeRole"
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_policy_attach" {
  role = aws_iam_role.codebuild_service_role
  policy_arn = aws_iam_policy.codebuild_policy.arn
}
