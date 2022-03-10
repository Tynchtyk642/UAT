module "eks" {
  source = "./modules"

  vpc_id          = var.vpc_id
  cluster_name    = var.eks_name
  cluster_version = var.eks_version
  bastion_cidr    = var.bastion_cidr

  subnet_ids = var.subnets
  # additional_sg_id = var.additional_sg_ids

  node_groups = var.node_groups
}