output "iam_user_name" {
  value = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  value = aws_iam_user.s3_reader.arn
}