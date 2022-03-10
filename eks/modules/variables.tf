variable "node_groups" {
  type    = any
  default = {}
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster version."
  type        = string
}

variable "subnet_ids" {
  type = list(string)
}

# variable "additional_sg_id" {
#   description = "Additional Security Groups."
# }

variable "vpc_id" {}

variable "bastion_cidr" {}