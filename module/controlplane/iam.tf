resource "aws_iam_role" "control_plane" {
  name = "eks-${var.name}-control-plane"
  path = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
              "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "control_plane" {
  count      = length(local.eks_arns)
  role       = aws_iam_role.control_plane.name
  policy_arn = local.eks_arns[count.index]
}
