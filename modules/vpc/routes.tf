resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  # route {
  #   cidr_block     = var.peer_cidr_block
  #   vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  # }

  tags = {
    Name = "${var.env}-${var.vpc_name}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  # route {
  #   cidr_block = var.peer_cidr_block
  #   vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  # }

  tags = {
    Name = "${var.env}-${var.vpc_name}"
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
