terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "s3_reader" {
  name = var.iam_user_name
}

resource "aws_iam_user_policy" "s3_read" {
  name = "${var.iam_user_name}-s3-read"
  user = aws_iam_user.s3_reader.name

  policy = jsonencode({
    Version = var.s3_read_policy.version
    Statement = [
      {
        Effect   = var.s3_read_policy.effect
        Action   = var.s3_read_policy.bucket_actions
        Resource = "arn:aws:s3:::${var.s3_bucket_name}"
      },
      {
        Effect   = var.s3_read_policy.effect
        Action   = var.s3_read_policy.object_actions
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
      }
    ]
  })
}