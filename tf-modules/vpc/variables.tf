variable "name_prefix" {
  description = "Default prefix for resources name tag"
  type        = string
  default     = "gitlab"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet. Must be in VPC range"
  type        = string
  default     = "172.16.1.0/24"
}