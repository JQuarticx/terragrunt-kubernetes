resource "aws_security_group" "worker" {
  name        = "eks-${var.cluster_name}-${var.team}"
  description = "This is the security group for eks-${var.cluster_name}-${var.team} nodes. Use this to give worker specific access to aws resources like DBs."
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", "eks-${var.cluster_name}-${var.team}")
    },
    var.tags,
  )
}
