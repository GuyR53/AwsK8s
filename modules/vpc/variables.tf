variable "env" {
  description = "Environment name."
  type        = string
}

variable "vpc_name" {
  description = "Vpc name."
  type        = string
}


variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = string
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "public_subnets"{
  description = "CIDR for public subnets"
  type        = list(string)
}

variable "private_subnets"{
  description = "CIDR for public subnets"
  type        = list(string)
}














