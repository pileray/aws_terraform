# 画像保存用バケットの作成
resource "aws_s3_bucket" "menta-aws-practice-net" {
  bucket = "menta-aws-practice-net"

  tags = {
    Name = "menta-aws-practice-net"
  }
}

# ログ保存用バケットの作成
resource "aws_s3_bucket" "log-menta-me" {
  bucket = "log.menta.me"

  tags = {
    Name = "log.menta.me"
  }
}

resource "aws_s3_bucket_public_access_block" "log-menta-me-public-access-block" {
  bucket = aws_s3_bucket.log-menta-me.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "log-menta-me-versioning" {
  bucket = aws_s3_bucket.log-menta-me.id
  versioning_configuration {
    status = "Enabled"
  }
}

# ログ変換用Lambdaの格納
resource "aws_s3_bucket_object" "menta_lambda_for_ltsv_logs_zip" {
  depends_on = [ aws_s3_bucket.log-menta-me ]
  bucket = "log.menta.me"
  key    = "lambda_function/menta_lambda_for_ltsv_logs.zip"
  source = "./files/lambda_function/menta_lambda_for_ltsv_logs.zip"
}