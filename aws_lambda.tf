# # Lambdaの作成
# resource "aws_lambda_function" "menta_lambda_for_ltsv_logs" {
#   depends_on = [ aws_s3_bucket_object.menta_lambda_for_ltsv_logs_zip ]
#   s3_bucket     = "log.menta.me"
#   s3_key = "lambda_function/menta_lambda_for_ltsv_logs.zip"
#   function_name = "menta_lambda_for_ltsv_logs"
#   role          = aws_iam_role.menta_lambda_for_ltsv_logs_role.arn
#   handler       = "index.handler"
#   runtime       = "nodejs14.x"
#   timeout       = "120"
#   memory_size   = "512"
# }