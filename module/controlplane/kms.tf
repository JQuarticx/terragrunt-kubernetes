resource "aws_kms_key" "kms" {
  description             = "This is for kms key for eks cluster name: ${var.name}"
  key_usage               = "ENCRYPT_DECRYPT"
  policy                  = var.iam_policy
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.enable_key_rotation
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.name}"
  target_key_id = aws_kms_key.kms.id
}
