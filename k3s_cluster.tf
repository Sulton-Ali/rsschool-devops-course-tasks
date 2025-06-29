# k3s Kubernetes Cluster (Master + Agent in Private Subnets)

# Master Node
resource "aws_instance" "k3s_master" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_k3s
  subnet_id                   = aws_subnet.private[0].id
  vpc_security_group_ids      = [aws_security_group.private__instance_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    curl -sfL https://get.k3s.io | sh -
  EOF

  tags = {
    Name = "k3s-master"
  }
}

# Agent Node (joins master)
resource "aws_instance" "k3s_agent" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_k3s
  subnet_id                   = aws_subnet.private[1].id
  vpc_security_group_ids      = [aws_security_group.private__instance_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    # Placeholder: see README for join instructions
  EOF

  tags = {
    Name = "k3s-agent"
  }
}
