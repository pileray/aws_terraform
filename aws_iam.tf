## EC2インスタンス用ロールの作成
# IAMロールの作成
resource "aws_iam_role" "menta_appserver_role" {
  name = "menta_appserver_role"
  assume_role_policy = file("files/iam_policy/menta_appserver_assume_role.json")
  tags = {
    Name = "menta_appserver_role"
  }
}

# ポリシーの作成
resource "aws_iam_policy" "menta_appserver_policy" {
  name        = "menta_appserver_policy"
  path        = "/"
  description = "Privide menta appserver with S3 & CloudWatchLogs fullaccess"
  policy = file("files/iam_policy/menta_appserver_policy.json")
}

# ロールへポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "menta_appserver_policy_attach" {
  role       = aws_iam_role.menta_appserver_role.name
  policy_arn = aws_iam_policy.menta_appserver_policy.arn
}

# IAMロールのアタッチ
resource "aws_iam_instance_profile" "menta_appserver_role_profile" {
  name = "menta_appserver_role_profile"
  role = aws_iam_role.menta_appserver_role.name
}

## CWLサブスクリプションフィルター用ロールの作成
# IAMロールの作成
resource "aws_iam_role" "menta_cwl_firehose_subscriptionfilter_role" {
  name = "menta_cwl_firehose_subscriptionfilter_role"
  assume_role_policy = file("files/iam_policy/menta_cwl_firehose_subscriptionfilter_assume_role.json")
  tags = {
    Name = "menta_cwl_firehose_subscriptionfilter_role"
  }
}

# ポリシーの作成
resource "aws_iam_policy" "menta_cwl_firehose_subscriptionfilter_policy" {
  name        = "menta_cwl_firehose_subscriptionfilter_policy"
  path        = "/"
  policy = file("files/iam_policy/menta_cwl_firehose_subscriptionfilter_policy.json")
}

# ロールへポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "menta_cwl_firehose_subscriptionfilter_policy_attach" {
  role       = aws_iam_role.menta_cwl_firehose_subscriptionfilter_role.name
  policy_arn = aws_iam_policy.menta_cwl_firehose_subscriptionfilter_policy.arn
}

## KinesisFirehose用ロールの作成
# IAMロールの作成
resource "aws_iam_role" "menta_firehose_role" {
  name = "menta_firehose_role"
  assume_role_policy = file("files/iam_policy/menta_firehose_assume_role.json")
  tags = {
    Name = "menta_firehose_role"
  }
}

# ポリシーの作成
resource "aws_iam_policy" "menta_firehose_policy" {
  name        = "menta_firehose_policy"
  path        = "/"
  policy = file("files/iam_policy/menta_firehose_policy.json")
}

# ロールへポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "menta_firehose_policy_attach" {
  role       = aws_iam_role.menta_firehose_role.name
  policy_arn = aws_iam_policy.menta_firehose_policy.arn
}

## LTSV形式変換Lambda用のロールの作成
# IAMロールの作成
resource "aws_iam_role" "menta_lambda_for_ltsv_logs_role" {
  name = "menta_lambda_for_ltsv_logs_role"
  assume_role_policy = file("files/iam_policy/menta_lambda_for_ltsv_logs_assume_role.json")
  tags = {
    Name = "menta_lambda_for_ltsv_logs_role"
  }
}

# ポリシーの作成
resource "aws_iam_policy" "menta_lambda_for_ltsv_logs_policy" {
  name        = "menta_lambda_for_ltsv_logs_policy"
  path        = "/"
  policy = file("files/iam_policy/menta_lambda_for_ltsv_logs_policy.json")
}

# ロールへポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "menta_lambda_for_ltsv_logs_policy_attach" {
  role       = aws_iam_role.menta_lambda_for_ltsv_logs_role.name
  policy_arn = aws_iam_policy.menta_lambda_for_ltsv_logs_policy.arn
}