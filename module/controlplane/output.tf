output "cluster_name" {
  value = aws_eks_cluster.cluster.id
}

output "common_security_group_id" {
  value = aws_security_group.common.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key."
  value       = aws_kms_key.kms.arn
}

output "key_id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.kms.id
}

output "key_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = aws_kms_alias.kms_alias.arn
}

output "key_alias_name" {
  description = "The display name of the alias."
  value       = aws_kms_alias.kms_alias.name
}
