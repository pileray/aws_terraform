# SSL証明書作成
resource "aws_acm_certificate" "menta-aws-practice-net_acm" {
  domain_name       = "menta-aws-practice.net"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "menta-aws-practice-net_acm"
  }
}

# ホストゾーンのデータ取得
data "aws_route53_zone" "menta-aws-practice-net" {
  name         = "menta-aws-practice.net"
  private_zone = false
}

resource "aws_route53_record" "menta-aws-practice-net_cert_record" {
  for_each = {
    for dvo in aws_acm_certificate.menta-aws-practice-net_acm.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.menta-aws-practice-net.zone_id
}

resource "aws_acm_certificate_validation" "menta-aws-practice-net_cert" {
  certificate_arn         = aws_acm_certificate.menta-aws-practice-net_acm.arn
  validation_record_fqdns = [for record in aws_route53_record.menta-aws-practice-net_cert_record : record.fqdn]
}
