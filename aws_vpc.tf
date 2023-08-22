# menta_vpc作成
resource "aws_vpc" "menta_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "menta_vpc"
  }
}
