output "arn" {
  value = aws_iam_role.worker.arn
}

output "id" {
  value = aws_iam_role.worker.id
}

output "name" {
  value = aws_iam_role.worker.name
}

output "profile_arn" {
  value = aws_iam_instance_profile.worker.arn
}
