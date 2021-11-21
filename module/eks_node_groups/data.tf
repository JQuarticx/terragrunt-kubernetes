data "aws_security_group" "common_security_group_id" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["eks-${var.cluster_name}-common"]
  }
}
