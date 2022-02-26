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

resource "aws_iam_role" "codebuild_role" {
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
  role = aws_iam_role.codebuild_role.arn
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

resource "aws_iam_role" "codepipeline_role" {
  name = "${var.infra_name}-codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${var.infra_name}-codebuild-policy"
  role = aws_iam_role.codepipeline_role.id

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
