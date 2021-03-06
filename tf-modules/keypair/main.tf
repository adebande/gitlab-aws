resource "tls_private_key" "deployer" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.deployer.private_key_pem
  filename = "private_key.pem"
}

resource "aws_key_pair" "ssh" {
  key_name   = "${var.name_prefix}-deployer-key"
  public_key = tls_private_key.deployer.public_key_openssh
  tags = {
    Name = "${var.name_prefix}-deployer-keypair"
  }
}