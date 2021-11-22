generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
        region = "us-east-2"
    }
    EOF
}

inputs = {

    name                        = "prod"
    env                         = "prod"
    cluster_version             = "1.18"
    vpc_id                      = "vpc-0e13c8741a7ebbc6cv"
    subnet_ids                  = ["subnet-0f1591cf5dba5eb73", "subnet-0f1591cf5dba5eb73"]
    endpoint_private_access     = true
    endpoint_public_access      = false
    log_retention_days          = 7
    additional_cidrs            = ["10.10.0.0/16"]
    eks_version                 = "1.18"
    namespace                   = "eks_namespace"
    vpc_security_group_ids      = ["sg-07b046954010dec49"]
    desired_size                = "2"
    max_size                    = "3"
    min_size                    = "1"
    instance_type               = "t2.medium"
    team                        = "eks_team"
    cluster_name                = "eks"
    key_name                    = "datadog"
    volume_size                 = "30"
    image_id                    = "ami-0d718c3d715cec4a7"
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
    bucket         = "eks10112021"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}

