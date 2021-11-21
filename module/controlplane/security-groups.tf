#Master Node SG.
resource "aws_security_group" "cluster" {
  name        = "eks-${var.name}-control-plane"
  description = "Control Plane node SG which allows access for api server."
  vpc_id      = var.vpc_id

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    self            = true
    security_groups = [aws_security_group.common.id]
    //  cidr_blocks = ["0.0.0.0/0"]
    description = "TODO: This can be more restrictive. Allows outbound traffic from the controlplane."
  }

  tags = merge(
    {
      "Name" = format("%s", "eks-${var.name}-control-plane")
    },
    var.tags,
  )
}

resource "aws_security_group_rule" "vpn-cidr" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = var.public_access_cidrs
  description       = "This allows ingres to control plane from vpn and any additional cidr required for specific caller"
  security_group_id = aws_security_group.cluster.id
}

resource "aws_security_group" "common" {
  name        = "eks-${var.name}"
  description = "This is the common SG attached to all nodes in the cluster including the control-plane. This is required so inter cluster communication works."
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", "eks-${var.name}-common")
    },
    var.tags,
  )
}

resource "aws_security_group_rule" "common_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  description       = "This allows all traffic between nodes in the cluster."
  security_group_id = aws_security_group.common.id
}

resource "aws_security_group_rule" "common_outbound" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  //  cidr_blocks       = ["0.0.0.0/0"]
  self              = true
  description       = "This allows all egress traffic from the nodes in the cluster."
  security_group_id = aws_security_group.common.id
}

resource "aws_security_group_rule" "common_outbound_443" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "This allows all egress traffic on port 443"
  security_group_id = aws_security_group.common.id
}

resource "aws_security_group_rule" "common_outbound_vpc" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = split(",", data.aws_vpc.vpc.cidr_block)
  description       = "This allows all egress traffic for the vpc"
  security_group_id = aws_security_group.common.id
}

resource "aws_security_group_rule" "common_outbound_636" {
  type              = "egress"
  from_port         = 636
  to_port           = 636
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "This allows all egress traffic on port 636 for LDAP"
  security_group_id = aws_security_group.common.id
}
