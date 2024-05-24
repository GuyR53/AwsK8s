variable "env" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Vpc name."
  type        = string
  default     = "testing"
}

variable "eks_name" {
  description = "Eks name."
  type        = string
  default     = "testing"
}

variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = string
  default     = "10.60.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
  default     =["us-west-2a", "us-west-2b", "us-west-2d", "us-west-2c"]
}

variable "public_subnets"{
  description = "CIDR for public subnets"
  type        = list(string)
  default     = ["10.60.0.0/18"]
}

variable "private_subnets"{
  description = "CIDR for public subnets"
  type        = list(string)
  default     = ["10.60.64.0/18", "10.60.128.0/18", "10.60.192.0/18"]
}

variable "node_groups" {
  description = "Map of node groups and their configurations"
  type = map(object({
    capacity_type  = string
    instance_types = list(string)
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
  default = {
    testnodegroup = {
      capacity_type  = "ON_DEMAND"
      instance_types = ["t3.medium"]
      scaling_config = {
        desired_size = 2
        max_size     = 2
        min_size     = 2
      }
    }
    
  }
}

variable "eks_version" {
  description = "Desired Kubernetes master version."
  type        = string
  default     = "1.30"
}

variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = true
}






