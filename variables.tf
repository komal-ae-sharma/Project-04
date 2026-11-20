variable "aws_region" {
  description = "AWS region for the provider"
  type        = string
  default     = "ap-south-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
}

variable "s3_bucket_name" {
  description = "Existing bucket this user can read"
  type        = string
}

variable "s3_read_policy" {
  description = "S3 read-only policy settings"
  type = object({
    version        = string
    effect         = string
    bucket_actions = list(string)
    object_actions = list(string)
  })

  default = {
    version        = "2012-10-17"
    effect         = "Allow"
    bucket_actions = ["s3:ListBucket"]
    object_actions = ["s3:GetObject"]
  }
}