variable "owner" {
  description = "Name of the resources owner"
  type        = string
  default     = "example"
}

variable "project_name" {
  description = "Resources project tag"
  type        = string
  default     = "gitlab"
}

variable "name_prefix" {
  description = "Default prefix for resources name tag"
  type        = string
  default     = "gitlab"
}

variable "region" {
  description = "AWS region resources are launched in"
  type        = string
  default     = "eu-north-1"
}

variable "ssh_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instances via HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}