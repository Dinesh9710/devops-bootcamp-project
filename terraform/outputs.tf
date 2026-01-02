
output "web_server_public_ip" {
  description = "The Elastic IP assigned to the Web Server"
  value       = aws_eip.web_eip.public_ip
}

output "web_server_private_ip" {
  description = "The internal IP of the Web Server"
  value       = aws_instance.web_server.private_ip
}


output "ansible_controller_private_ip" {
  description = "The internal IP of the Ansible Controller"
  value       = aws_instance.ansible_controller.private_ip
}


output "monitoring_server_private_ip" {
  description = "The internal IP of the Monitoring Server"
  value       = aws_instance.monitoring_server.private_ip
}

output "vpc_id" {
  description = "The ID of the devops-vpc"
  value       = aws_vpc.devops_vpc.id
}