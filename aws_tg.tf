# # ターゲットグループの作成
# resource "aws_lb_target_group" "menta_elb_tg" {
#   name     = "menta-elb-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.menta_vpc.id
# }

# # インスタンスの登録
# resource "aws_lb_target_group_attachment" "menta_elb_tg_appserver_01" {
#   target_group_arn = aws_lb_target_group.menta_elb_tg.arn
#   target_id        = aws_instance.menta_appserver[0].id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "menta_elb_tg_appserver_02" {
#   target_group_arn = aws_lb_target_group.menta_elb_tg.arn
#   target_id        = aws_instance.menta_appserver[1].id
#   port             = 80
# }

# # Wordpressログイン用のターゲットグループ作成
# resource "aws_lb_target_group" "menta_wp_login_tg" {
#   name     = "menta-wp-login-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.menta_vpc.id
# }

# # インスタンスの登録
# resource "aws_lb_target_group_attachment" "menta_wp_login_tg_appserver_01" {
#   target_group_arn = aws_lb_target_group.menta_wp_login_tg.arn
#   target_id        = aws_instance.menta_appserver[0].id
#   port             = 80
# }
