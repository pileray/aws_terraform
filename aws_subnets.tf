# サブネット作成
resource "aws_subnet" "public" {
  for_each = var.subnets.public_subnets

  vpc_id     = aws_vpc.menta_vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.name
  }
}

resource "aws_subnet" "private" {
  for_each = var.subnets.private_subnets

  vpc_id     = aws_vpc.menta_vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.name
  }
}
