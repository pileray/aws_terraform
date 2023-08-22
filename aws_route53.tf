# # AレコードにALBのエイリアスを追加
# resource "aws_route53_record" "menta-aws-practice-net" {
#   zone_id = data.aws_route53_zone.menta-aws-practice-net.zone_id
#   name    = "menta-aws-practice.net"
#   type    = "A"

#   alias {
#     name                   = aws_lb.menta_elb.dns_name
#     zone_id                = aws_lb.menta_elb.zone_id
#     evaluate_target_health = true
#   }
# }
