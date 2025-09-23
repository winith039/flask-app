
# VPC

module "vpc" {
  
	source = "terraform-aws-modules/vpc/aws"
	version = "5.8.1"
	
	name = "${var.project_name}-vpc"
	azs = var.azs
	public_subnets = var.public_subnets
	private_subnets = var.private_subnets

	enable_nat_gateway = true
	single_nat_gateway = true

	tags = {
	    Project = var.project_name
	}
}

#EKS

module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.8.5"
      
    cluster_name = "${var.project_name}-eks"
    cluster_version = var.cluster_version

    cluster_endpoint_public_access = true
    
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    enable_irsa = false


    eks_managed_node_groups = {
	default = {
	    instance_types = var.instance_types
	    desired_size = var.desired_capacity
	    min_size = 1
	    max_size = 3
	}
    }
    
    enable_cluster_creator_admin_permissions = true
 

     tags = {
	Project = var.project_name
	}
}
