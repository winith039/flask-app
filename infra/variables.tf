variable "project_name" {
	description = "Name prefix for all resources"
	type = string
	default = "autoscale-flask"
}

variable "region" {
	description = "AWS region"
	type = string
	default = "ap-south-1"
}

variable "vpc_cidr"{
	description = "CIDR for VPC"
	type = string
	default = "10.0.0.0/16"
}

variable "azs" {
	description = "Availability zones"
	type = list(string)
	default = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
	description = "Public subnet CIDRs"
  	type        = list(string)
  	default     = ["10.0.0.0/24" , "10.0.1.0/24"]
}
variable "private_subnets" {
        description = "Private subnet CIDRs"
        type        = list(string)
        default     = ["10.0.2.0/24" , "10.0.3.0/24"]
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "desired_capacity" {
  description = "Desired node count for the default node group"
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "Instance types for node group"
  type        = list(string)
  default     = ["t3.small"]
}
