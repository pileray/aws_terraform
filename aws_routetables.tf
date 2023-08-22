# ルートテーブルの作成
resource "aws_route_table" "menta_route_igw" {
  vpc_id = aws_vpc.menta_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.menta_igw.id
  }

  tags = {
    Name = "menta_route_igw"
  }
}

resource "aws_route_table" "menta_route_private" {
  vpc_id = aws_vpc.menta_vpc.id
  
  tags = {
    Name = "menta_route_private"
  }
}

# サブネットへの関連付け
resource "aws_route_table_association" "menta_route_igw_assoc" {
  for_each = var.subnets.public_subnets

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.menta_route_igw.id
}

resource "aws_route_table_association" "menta_route_private_assoc" {
  for_each = var.subnets.private_subnets

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.menta_route_private.id
}
