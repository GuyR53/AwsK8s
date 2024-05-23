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










