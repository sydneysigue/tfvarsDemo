output "subnet_id" {
  value       = aws_subnet.sub1.id
  description = "The domain name of the load balancer"
}

output "security_groups" {
  value       = aws_security_group.ssh.id
  description = "The domain name of the load balancer"
}
