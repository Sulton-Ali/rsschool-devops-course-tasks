
output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs."
  value       = aws_subnet.private.*.id
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion Host."
  value       = aws_instance.bastion.public_ip
}

output "k3s_master_private_ip" {
  value = aws_instance.k3s_master.private_ip
}

output "k3s_agent_private_ip" {
  value = aws_instance.k3s_agent.private_ip
}
