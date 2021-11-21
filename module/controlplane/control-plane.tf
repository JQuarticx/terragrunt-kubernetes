resource "aws_eks_cluster" "cluster" {
  lifecycle {
    ignore_changes = [certificate_authority]
  }
  name                      = var.name
  role_arn                  = aws_iam_role.control_plane.arn
  enabled_cluster_log_types = ["api", "audit"]
  version                   = var.eks_version

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    subnet_ids              = var.subnet_ids
    security_group_ids      = concat(var.vpc_security_group_ids, [aws_security_group.cluster.id, aws_security_group.common.id])
  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = aws_kms_key.kms.arn
    }
  }
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
  # depends_on = [aws_cloudwatch_log_group.cluster]
}

# resource "aws_cloudwatch_log_group" "cluster" {
#   name              = "/aws/eks/${var.name}/cluster"
#   retention_in_days = var.log_retention_days
#   tags = merge(
#     {
#       "Name" = format("%s", var.name)
#     },
#     var.tags,
#   )
# }
