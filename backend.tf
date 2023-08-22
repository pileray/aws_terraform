terraform {
  backend "s3" {
    bucket = "menta-terraform-file"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
    profile = "menta-terraform"
  }
}