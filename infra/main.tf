# VPC

module "vpc" {

	source = "terraform-aws-modules/vpc/aws"
	version = "5.5.1"
	
	name = "${var.project_name}-vpc"
	azs = var.azs
	public_subnets = var.public_subnets

	enable_nat_gateway = false

	tags = {
	    Project = var.project_name
	}
}

#EKS

module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.24.0"
      
    cluster_name = "${var.project_name}-eks"
    cluster_version = var.cluster_version

    cluster_endpoint_public_access = true

    enable_irsa = false

    eks_managed_node_groups = {
	default = {
	    min_size = 1
	    max_size = 3
	    desired_size = var.desired_capacity
	    instance_types = t3.micro
	    disk_size = 10
	}
}

     tags = {
	Project = var.project_name
	}
}
