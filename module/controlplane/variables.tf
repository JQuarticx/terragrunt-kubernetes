variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name for the cluster"
}

variable "env" {
  description = "Environment for the cluster"
}

variable "cluster_version" {
  default = "1.18"
}

variable "vpc_id" {
  description = "VPC id for resource creation"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the control plane."
  type        = list(any)
}

variable "endpoint_private_access" {
  default = true
}

variable "endpoint_public_access" {
  default = false
}

variable "log_retention_days" {
  default = 7
}

variable "additional_cidrs" {
  default = []
}

variable "eks_version" {
  default = "1.18"
}

variable "vpc_security_group_ids" {
  description = "List of SGs"
  type        = list(any)
  default     = []
}

variable "public_access_cidrs" {
  type        = list(any)
  description = "public access cidrs"
  default     = ["0.0.0.0/0"]
}

variable "private_access_cidrs" {
  type        = list(any)
  description = "private access cidrs"
  default     = ["0.0.0.0/0"]
}

# KMS

variable "deletion_window_in_days" {
  description = "The duration in days after which the key is deleted after destruction of the resource"
  type        = string
  default     = 30
}

variable "iam_policy" {
  description = "The policy of the key usage"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_key_rotation" {
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
  default     = true
}
