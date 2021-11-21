generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
        region = "us-east-1"
    }
    EOF
}

# terraform {
#   source = "."
# }

inputs = {
    
    name                        = ""
    env                         = "prod"
    cluster_version             = "1.18"
    vpc_id                      = ""
    subnet_ids                  = ["xxx", "yyy"]
    endpoint_private_access     = true
    endpoint_public_access      = false
    log_retention_days          = 7
    additional_cidrs            = []
    eks_version                 = "1.18"
    namespace                   = ""
    vpc_security_group_ids      = []
    desired_size                = ""
    max_size                    = ""
    min_size                    = ""
    instance_type               = ""
    team                        = ""
    cluster_name                = ""
    key_name                    = ""
    volume_size                 = ""
    image_id                    = ""
    tags                        = {
        Terraform = "true"
        Environment = "dev"
    } 
}


remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "s3bucketname"                 # Bucket name changes required
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}