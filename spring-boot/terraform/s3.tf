
resource "aws_s3_bucket" "build_cache" {
  bucket = "${var.aws_account_id}-${var.infra_name}-cache"
  acl = "private"

  tags = {
    infra_name = var.infra_name
    admin_name = var.admin_name
    admin_email = var.admin_email
    purpose = var.purpose
  }
}

resource "aws_s3_bucket" "build_artifact" {
  bucket = "${var.aws_account_id}-${var.infra_name}-artifact"
  acl = "private"

  tags = {
    infra_name = var.infra_name
    admin_name = var.admin_name
    admin_email = var.admin_email
    purpose = var.purpose
  }
}

resource "aws_s3_bucket" "build_log" {
  bucket = "${var.aws_account_id}-${var.infra_name}-log"
  acl = "private"

  tags = {
    infra_name = var.infra_name
    admin_name = var.admin_name
    admin_email = var.admin_email
    purpose = var.purpose
  }
}
