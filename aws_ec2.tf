# # インスタンスの作成
# resource "aws_instance" "menta_appserver" {
#   count = 2

#   ami           = var.ec2_type.ami
#   instance_type = var.ec2_type.type
#   key_name = "menta"
#   vpc_security_group_ids = [aws_security_group.menta_app_sg.id]
#   subnet_id = lookup(var.subnets_id, count.index%3)
#   # aws_iam.tfでプロファイル作成
#   iam_instance_profile = aws_iam_instance_profile.menta_appserver_role_profile.name

#   tags = {
#     Name = format("menta_appserver_%02d", count.index + 1)
#   }
# }
