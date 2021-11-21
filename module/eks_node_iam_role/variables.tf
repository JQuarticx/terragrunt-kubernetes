
variable "name" {
  type        = string
  description = "EKS cluster name"
}

variable "namespace" {
  type = string
  description = "EKS namespace"
  default = ""
}