
variable "name"                   {} 
variable "env"                    {} 
variable "cluster_version"        {} 
variable "vpc_id"                 {} 
variable "endpoint_private_access" {} 
variable "endpoint_public_access" {} 
variable "log_retention_days"     {} 
variable "additional_cidrs"       {} 
variable "eks_version"            {} 
variable "namespace"              {} 
variable "desired_size"           {} 
variable "max_size"               {} 
variable "min_size"               {} 
variable "instance_type"          {} 
variable "team"                   {} 
variable "cluster_name"           {} 
variable "key_name"               {} 
variable "volume_size"            {} 
variable "image_id"               {} 
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "subnet_ids" {
  description = "Subnets for the control plane."
  type        = list(any)
}

variable "vpc_security_group_ids" {
  description = "List of SGs"
  type        = list(any)
  default     = []
}

