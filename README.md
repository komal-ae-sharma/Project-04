# Project 04: S3 Read-Only IAM User

This Terraform configuration creates an AWS IAM user and attaches an inline policy that allows the user to list one existing S3 bucket and retrieve objects from it. It does not create the bucket or generate access keys.

## What gets created

- An IAM user named by `iam_user_name`.
- An inline policy allowing `s3:ListBucket` on the configured bucket and `s3:GetObject` on its objects.

The policy grants access only to the bucket named by `s3_bucket_name`. The AWS region defaults to `ap-south-1`.

## Prerequisites

- Terraform 1.5.0 or later.
- AWS credentials configured for Terraform through the AWS CLI, environment variables, or another supported AWS credentials provider.
- An existing S3 bucket and AWS credentials authorized to create IAM users and policies.

## Configure

Copy the example variables file and edit the values for your environment:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

Set `aws_region`, `iam_user_name`, and `s3_bucket_name` in `terraform.tfvars`. The `s3_read_policy` variable defaults to `s3:ListBucket` and `s3:GetObject`; change it only if you intend to grant different permissions.

## Deploy

Run these commands from the project directory:

```powershell
terraform init
terraform validate
terraform plan
terraform apply
```

Review the plan before applying. Terraform outputs the created IAM user's name and ARN. The configuration does not create sign-in credentials or access keys for the user.

## Clean up

To delete the IAM user and its inline policy:

```powershell
terraform destroy
```

This does not delete the S3 bucket.

## State and credentials

Terraform state can contain sensitive infrastructure details. Keep state files and `terraform.tfvars` private, and use a secured remote state backend for shared or production use. AWS credentials should not be stored in this repository.