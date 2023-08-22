# # サブネットグループ作成
# resource "aws_db_subnet_group" "menta_rds_subnetgroup" {
#   name       = "menta_rds_subnetgroup"
#   subnet_ids = [aws_subnet.public["app_1a"].id, aws_subnet.public["app_1c"].id]

#   tags = {
#     Name = "menta_rds_subnetgroup"
#   }
# }

# # パラメーターグループの作成
# resource "aws_db_parameter_group" "menta_rds_parameter_group_for_cwl" {
#   name   = "menta-rds-log"
#   family = "mysql8.0"

#   parameter {
#     name  = "general_log"
#     value = 1
#   }

#   parameter {
#     name  = "slow_query_log"
#     value = 1
#   }

#   parameter {
#     name  = "log_output"
#     value = "FILE"
#   }
# }

# # オプショングループの作成
# resource "aws_db_option_group" "menta_rds_option_group_for_cwl" {
#   name                     = "menta-rds-log"
#   option_group_description = "Option group for audit of menta-rds in menta-aws-practice.net"
#   engine_name              = "mysql"
#   major_engine_version     = "8.0"

#   option {
#     option_name = "MARIADB_AUDIT_PLUGIN"
#   }
# }

# # RDSインスタンスの作成
# resource "aws_db_instance" "menta_rds" {
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "8.0.28"
#   instance_class       = "db.t3.micro"
#   name                 = var.RDS_DB_NAME
#   username             = var.RDS_USERNAME
#   password             = var.RDS_PASSWORD
#   skip_final_snapshot  = true
#   vpc_security_group_ids  = [aws_security_group.menta_rds_sg.id]
#   db_subnet_group_name = aws_db_subnet_group.menta_rds_subnetgroup.name
#   parameter_group_name = aws_db_parameter_group.menta_rds_parameter_group_for_cwl.name
#   option_group_name = aws_db_option_group.menta_rds_option_group_for_cwl.name
#   enabled_cloudwatch_logs_exports = ["general", "audit", "slowquery"]
#   apply_immediately = true
# }
