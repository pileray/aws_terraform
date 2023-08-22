# # firehoseの作成
# resource "aws_kinesis_firehose_delivery_stream" "menta_aws_practice_net_firehose" {
#   count = length(var.firehose_delivery_streams)

#   name        = var.firehose_delivery_streams[count.index]
#   destination = "extended_s3"

#   extended_s3_configuration {
#     role_arn   = aws_iam_role.menta_firehose_role.arn
#     bucket_arn = aws_s3_bucket.log-menta-me.arn
#     buffer_size         = 5
#     buffer_interval     = 300
#     prefix = "${var.firehose_delivery_streams[count.index]}/!{timestamp:yyyy/MM/dd}/"
#     error_output_prefix = "${var.firehose_delivery_streams[count.index]}/!{firehose:error-output-type}/!{timestamp:yyyy/MM/dd}/"

#     processing_configuration {
#       enabled = "true"

#       processors {
#         type = "Lambda"

#         parameters {
#           parameter_name  = "LambdaArn"
#           parameter_value = "${aws_lambda_function.menta_lambda_for_ltsv_logs.arn}:$LATEST"
#         }
#       }
#     }
#   }
# }