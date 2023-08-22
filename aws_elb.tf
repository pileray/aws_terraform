# # ALBの作成
# resource "aws_lb" "menta_elb" {
#   name               = "menta-elb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.menta_elb_sg.id]
#   subnets            = [aws_subnet.public["app_1a"].id, aws_subnet.public["app_1c"].id]

#   tags = {
#     Name = "menta_elb"
#   }
# }

# # httpsリスナーの設定
# resource "aws_lb_listener" "menta_elb_https_listener" {
#   load_balancer_arn = aws_lb.menta_elb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.menta-aws-practice-net_acm.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.menta_elb_tg.arn
#   }
# }

# # httpリスナーの設定（httpsへリダイレクト）
# resource "aws_lb_listener" "menta_elb_http_listener" {
#   load_balancer_arn = aws_lb.menta_elb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# # 管理画面を表示するインスタンスを固定化
# resource "aws_lb_listener_rule" "set_login_instance" {
#   listener_arn = aws_lb_listener.menta_elb_https_listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.menta_wp_login_tg.arn
#   }

#   condition {
#     path_pattern {
#       values = ["/wp-login.php", "/wp-admin/*"]
#     }
#   }
# }
