locals {
  node_group_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    aws_iam_policy.node_instance_assume_role_policy.arn
  ]

  tools_node_group_arns = [
    "arn:aws:iam::aws:policy/AmazonRoute53ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  ]
}
