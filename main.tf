

module "eks" {
  source = "./eks"

  vpc_id       = module.networking.vpc_id
  eks_name     = "test1"
  eks_version  = "1.20"
  subnets      = module.networking.private_subnets
  bastion_cidr = ["${data.aws_instance.bastion.public_ip}/32"]

  node_groups = {
    first = {
      node_group_name = "test"
      desired_size    = 3
      max_size        = 4
      min_size        = 2

      ami_type       = "AL2_x86_64"
      instance_types = ["t2.medium"]
    },
    second = {
      node_group_name = "test-1"
      desired_size    = 2
      max_size        = 3
      min_size        = 1

      ami_type       = "AL2_x86_64"
      instance_types = ["t2.small"]
    }
  }
}


module "networking" {
  source = "./networking"

  vpc_cidr         = var.vpc_cidr
  public_sn_count  = 3
  private_sn_count = 3
}




module "bastion" {
  source = "./bastion"

  bastion_name          = var.bastion_name

  bucket_name           = "s3-for-public-key"
  region                = "us-east-1"
  vpc_id                = module.networking.vpc_id
  is_lb_private         = true
  bastion_host_key_pair = aws_key_pair.test.key_name




  elb_subnets         = module.networking.public_subnets
  autoscaling_subnets = module.networking.public_subnets

  tags = {
    name        = "my_bastion_name"
    description = "my_bastion_description"
  }
}

resource "aws_key_pair" "test" {
  key_name   = "key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIrWpVGTN+jtNaYKsE54trP8LzCy+WUg89+P+1bpZdauGOwbxFShVk9Wk/8pFYkAYzxa73OEr1u/GYVBXPR8RXvf9MftWlBjIWxgC1AdvdlGkSxBzi2TGIV7hq51hJQMsKy12uHGqK/pCqP8VQBA07HTBi2XUuzwdQNCCXqWS3bbbatMnxqA7qO+DzBmJVf/W6OntIermy74kTty763LYS/buIjIY+WWxsC+FAKezLUI0Pk3KXA+1NjdWTNpJYa93zIa/6jecu83ytF63HbxK4KXAZT87biZNgUJw1oeMHDXNWhZWbErZAIaY+CI2u7ajFGRvkHYmDdRfLnBTSFErgT0JKxHRo/W0XH0fG3zDUvXJUgUCi2elZ8qw76YR7Y98iNke/Mn/vV1wNcik/cbsKVNZvf0v0qw8ouMPM3DOlYKdS8I0xOQozTm6NnRwOzZ1QFWKlP4WdRXzvGEjwJAxmgvC9i4ve0xAEq3fLRDDRWN8W5/6GkPQkIVKFctwT8ME= Ant@DESKTOP-AAVPF15"
}

