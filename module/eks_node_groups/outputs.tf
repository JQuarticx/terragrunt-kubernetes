output "arn" {
  value = aws_eks_node_group.this.arn
}

output "id" {
  value = aws_eks_node_group.this.id
}

output "resources" {
  value = aws_eks_node_group.this.resources
}

output "security_group_id" {
  value = aws_security_group.worker.id
}
