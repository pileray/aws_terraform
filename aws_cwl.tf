# # サブスクリプションフィルターの作成
# resource "aws_cloudwatch_log_subscription_filter" "subscription_for_firehose" {
#   count           = length(var.cwl_log_groups)

#   name            = "subscription_for_firehose"
#   log_group_name  = var.cwl_log_groups[count.index]
#   filter_pattern  = ""
#   destination_arn = element(aws_kinesis_firehose_delivery_stream.menta_aws_practice_net_firehose[*].arn, count.index)
#   role_arn        = aws_iam_role.menta_cwl_firehose_subscriptionfilter_role.arn
# }