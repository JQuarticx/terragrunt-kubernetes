resource "aws_iam_instance_profile" "worker" {
  name = var.name
  role = aws_iam_role.worker.name
}

resource "aws_iam_role" "worker" {
  name = var.name
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "worker" {
  count      = var.namespace == "tools" ? length(local.tools_node_group_arns) + length(local.node_group_arns) : length(local.node_group_arns)
  role       = aws_iam_role.worker.name
  policy_arn = var.namespace == "tools" ? concat(local.node_group_arns, local.tools_node_group_arns)[count.index] : local.node_group_arns[count.index]
}

data "aws_iam_policy_document" "node_instance_assume_role_policy_document" {
  statement {
    sid = "1"
    resources = [
      "arn:aws:iam::885744740453:role/Scheduler"
    ]
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_policy" "node_instance_assume_role_policy" {
  name   = "${var.name}-worker-assume-role-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.node_instance_assume_role_policy_document.json
}
