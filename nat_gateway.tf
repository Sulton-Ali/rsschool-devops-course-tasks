
resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.main] # Ensure IGW is ready before EIP for NAT
  tags = {
    Name = "MyDevOpsVPC-NAT-EIP"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  depends_on    = [aws_internet_gateway.main]

  tags = {
    Name = "MyDevOpsVPC-NATGateway"
  }
}

resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}
