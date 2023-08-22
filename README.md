# aws_terraform
## 要件
- Terraformを使ってAWS上でWordpressをホストする設定を自動化する
- EC2 2台で冗長化し、t2.microインスタンス(amazon linux 2)インストール
- ALBを用いてポート80への通信を443にリダイレクトする
- ACMでHTTPS化
- CloudWatch Logsを用いてnginxのアクセス,エラーログ,php-fpmのエラーログ,SSHのログを蓄積
- Wordpressの画像はS3にホストする
