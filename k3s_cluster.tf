# k3s Kubernetes Cluster and Bastion Host

# k3s_cluster.tf

resource "aws_instance" "k3s_master" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
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

resource "aws_instance" "k3s_agent" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private[1].id
  vpc_security_group_ids      = [aws_security_group.private__instance_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    MASTER_IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=k3s-master" --query "Reservations[*].Instances[*].PrivateIpAddress" --output text)
    curl -sfL https://get.k3s.io | K3S_URL="https://$MASTER_IP:6443" K3S_TOKEN="$(cat /var/lib/rancher/k3s/server/node-token)" sh -
  EOF

  tags = {
    Name = "k3s-agent"
  }
}
