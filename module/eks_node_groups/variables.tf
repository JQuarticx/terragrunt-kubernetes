variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "vpc id where node group subnet will be there"
}
variable "vpc_security_group_ids" {
  description = "List of SGs"
  type        = list(any)
  default     = []
}

variable "user_data" {
  type        = string
  description = "if we have user_data, we can update here in the from of bash script"
  default     = ""
}

variable "worker_iam_instance_profile" {
  type        = string
  description = "It's worker iam instance profile"
}

variable "worker_iam_role_arn" {
  type        = string
  description = "It's worker iam role arn"
}

variable "subnet_ids" {
  type        = list(any)
  description = "Private subnet for workers"
}

variable "desired_size" {
  type        = string
  description = "desired instance count"
}

variable "max_size" {
  type        = string
  description = "Max instance count"
}

variable "min_size" {
  type        = string
  description = "Min instance count"
}

# variable "ami_type" {
#   type        = string
#   description = "CUSTOM"
# }

variable "instance_type" {
  type        = string
  description = "Types of instance"
}

variable "team" {
  type        = string
  description = "It's env variable to identify team"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name where this node group will be added"
}

variable "key_name" {
  type        = string
  description = "Ec3 ssh key"
}

variable "env" {
  type        = string
  description = "Environment where this cluster and node group will be there"
}

variable "volume_size" {
  type        = string
  description = "size of EBS volume"
}

variable "image_id" {
  type        = string
  description = "Custom ami id"
}

