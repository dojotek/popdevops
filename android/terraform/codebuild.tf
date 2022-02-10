resource "aws_codebuild_project" "codebuild" {
  #
  # Required arguments
  #
  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = var.compute_type
    image = var.image
    type = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name = "key1"
      value = "value1"
    }

    environment_variable {
      name = "key2"
      value = "value2"
    }
  }

  name = "${var.infra_name}-codebuild"

  service_role = aws_iam_role.codebuild_role.arn

  source {
    type = "GITHUB"
    location = "https://github.com/{$var.github_organization}/{$var.github_repository}.git"
    git_clone_depth = var.git_clone_depth

    git_submodules_config {
      fetch_submodules = true
    }
  }



  #
  # Optional arguments
  #
  description = "CodeBuild to run Android Gradle build and run automated tests"
  build_timeout = var.build_timeout

  cache {
    type = "S3"
    location = aws_s3_bucket.build_cache.bucket
  }

  logs_config {
    cloudwatch_logs {
      group_name = "/aws/codebuild/${var.infra_name}-codebuild"
    }

    s3_logs {
      status = "ENABLED"
      location = aws_s3_bucket.build_log.id
    }
  }

  source_version = var.git_branch_name

  tags = {
    infra_name = var.infra_name
    admin_name = var.admin_name
    admin_email = var.admin_email
    purpose = var.purpose
  }
}
