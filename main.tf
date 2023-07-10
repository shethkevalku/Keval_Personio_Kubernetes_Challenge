terraform {
  # Run init/plan/apply with "backend" commented-out (ueses local backend) to provision Resources (Bucket, Table)
  # Then uncomment "backend" and run init, apply after Resources have been created (uses AWS)
  backend "s3" {
    bucket         = "keval-personio-kubernetes-challenge-keval-tf-state"
    key            = "tf-infra/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "keval_personio_kubernetes_challenge-tf-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 4.0"
      version = "5.6.2"
    }
  }
  required_version = ">=0.13.0"
}

provider "aws" {
  region = "us-east-2"
}


module "tf-state" {
  source      = "./modules/tf-state"
  #Enter bucket name to store tf-state
  bucket_name = "keval-personio-kubernetes-challenge-keval-tf-state"
}

# module eks-infra {
#   source = "./modules/eks"
#     # EKS Input Vars
#   subnet_id_1 = module.vpc-infra.public_subnets_1.id
#   subnet_id_2 = module.vpc-infra.public_subnets_2.id
# }

module "vpc-infra" {
  source = "./modules/vpc"
  # VPC Input Varaibles
  vpc_cidr             = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

# module "ecr" {
#   source      = "./modules/ecr"
# }

