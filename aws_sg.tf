# セキュリティグループの作成
resource "aws_security_group" "menta_elb_sg" {
  name        = "menta_elb_sg"
  description = "menta_elb_sg"
  vpc_id      = aws_vpc.menta_vpc.id

  ingress {
    description      = "allow https from internet"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "allow http from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "menta_elb_sg"
  }
}

resource "aws_security_group" "menta_app_sg" {
  name        = "menta_app_sg"
  description = "menta_app_sg"
  vpc_id      = aws_vpc.menta_vpc.id

  ingress {
    description      = "allow http from menta_elb_sg"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    security_groups  = [aws_security_group.menta_elb_sg.id]
  }

  ingress {
    description      = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "menta_app_sg"
  }
}

resource "aws_security_group" "menta_rds_sg" {
  name        = "menta_rds_sg"
  description = "menta_rds_sg"
  vpc_id      = aws_vpc.menta_vpc.id

  ingress {
    description      = "allow mysql from menta_app_sg"
    from_port        = 3306
    to_port          = 3306
    protocol         = "TCP"
    security_groups  = [aws_security_group.menta_app_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "menta_rds_sg"
  }
}
