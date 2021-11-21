# main module

module "eks-control-plane" {
    source                      = "../module/controlplane"
    tags                        = var.tags
    name                        = var.name
    env                         = var.env
    cluster_version             = var.cluster_version
    vpc_id                      = var.vpc_id
    subnet_ids                  = var.subnet_ids
    endpoint_private_access     = var.endpoint_private_access # true
    endpoint_public_access      = var.endpoint_public_access  # false
    log_retention_days          = var.log_retention_days
    additional_cidrs            = var.additional_cidrs
    eks_version                 = var.eks_version
}

module "eks-worker-node-iam-role" {
    source                      = "../module/worker-node-iam-role"
    name                        = var.name
    namespace                   = var.namespace
}

module "eks-worker-node" {
    source                      = "../module/eks_node_groups"
    tags                        = var.tags
    vpc_id                      = var.vpc_id
    vpc_security_group_ids      = var.vpc_security_group_ids
    worker_iam_instance_profile = module.eks-worker-node-iam-role.profile_arn
    worker_iam_role_arn         = module.eks-worker-node-iam-role.arn
    subnet_ids                  = var.subnet_ids
    desired_size                = var.desired_size
    max_size                    = var.max_size
    min_size                    = var.min_size
    instance_type               = var.instance_type
    team                        = var.team
    cluster_name                = var.cluster_name
    key_name                    = var.key_name
    env                         = var.env
    volume_size                 = var.volume_size
    image_id                    = var.image_id
}