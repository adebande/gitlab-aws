variable "name_prefix" {
  description = "Default prefix for resources name tag"
  type        = string
  default     = "gitlab"
}

variable "instance_type" {
  description = "EC2 instance class"
  type        = string
  default     = "t3.micro"
}

variable "attach_eip" {
  description = "Attach an Elastic IP to the instance"
  type        = bool
}


variable "key_name" {
  description = "Name of SSH public key"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to deploy the instance in"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to deploy the instance in"
  type        = string
}

variable "ssh_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instance via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_authorized_cidr_blocks" {
  description = "List of cidr that are authorized to access the instance via HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}