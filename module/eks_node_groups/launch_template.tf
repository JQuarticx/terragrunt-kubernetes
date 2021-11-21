resource "aws_launch_template" "worker" {
  name_prefix   = "eks-${var.cluster_name}-${var.team}-"
  image_id      = var.image_id
  instance_type = var.instance_type

  monitoring {
    enabled = "true"
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.volume_size
      encrypted   = false
    }
  }

  key_name               = var.key_name
  vpc_security_group_ids = concat(var.vpc_security_group_ids, [data.aws_security_group.common_security_group_id.id, aws_security_group.worker.id])

  user_data = local.user_data

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}
