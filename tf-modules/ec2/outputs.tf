output "eip" {
  value = length(aws_eip.ec2) > 0 ? aws_eip.ec2[0].public_ip : null
}