variable "env" {
  description = "Environment name."
  type        = string
}

variable "eks_version" {
  description = "Desired Kubernetes master version."
  type        = string
}

variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}




variable "node_groups" {
  description = "EKS node groups"
  type        = map(any)
}


variable "security_group_id" {
  description = "ID of the security group created in the VPC module"
  type        = string 
}


variable "nodegroup_securitygroup" {
  description = "ID of the security group created in the VPC module"
  type        = string   
}