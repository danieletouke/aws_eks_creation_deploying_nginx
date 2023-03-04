
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.0"



  cluster_name = "kube-cluster-dan"
  cluster_version = 1.24
  cluster_endpoint_public_access = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  tags = {
    environment = "dev"
    application = "nginx"
  }

  eks_managed_node_groups = {
    dev = {
        min_size = 1
        max_size = 3
        desired_size = 3
        instance_types = ["t2.small"]
    }
  }
}