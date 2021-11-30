output "host_public_ip" {
  value       = module.gitlab_host_instance.eip
  description = "Gitlab host instance public IP"
}

output "runner_public_ip" {
  value       = module.gitlab_runner_instance.eip
  description = "Gitlab host instance public IP"
}

