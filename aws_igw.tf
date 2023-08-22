# IGW作成・アタッチ
resource "aws_internet_gateway" "menta_igw" {
  vpc_id = aws_vpc.menta_vpc.id

  tags = {
    Name = "menta_igw"
  }
}
