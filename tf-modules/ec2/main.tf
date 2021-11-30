data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  key_name = var.key_name

  tags = {
    Name = "${var.name_prefix}-main"
  }
  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_eip" "ec2" {

  count = var.attach_eip ? 1 : 0

  vpc = true

  instance = aws_instance.main.id
  tags = {
    Name = "${var.name_prefix}-eip"
  }

}



resource "aws_security_group" "ec2" {
  description = "Security Group for EC2 Instances."
  vpc_id      = var.vpc_id
  ingress {
    description = "Allowing SSH connections from authorised CIDRs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_authorized_cidr_blocks
  }
  ingress {
    description = "Allowing HTTP connections from authorised CIDRs"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.https_authorized_cidr_blocks
  }
  ingress {
    description = "Allowing HTTPS connections from authorised CIDRs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.https_authorized_cidr_blocks
  }
  egress {
    description = "Allowing egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.name_prefix}-instances-sg"
  }
}