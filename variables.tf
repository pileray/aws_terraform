variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = map(any)
  default = {
    public_subnets = {
      public_1a = {
        name = "menta_public_1a"
        cidr = "10.0.6.0/24"
        az = "ap-northeast-1a"
      },
      public_1c = {
        name = "menta_public_1c"
        cidr = "10.0.106.0/24"
        az = "ap-northeast-1c"
      },
      app_1a = {
        name = "menta_app_1a"
        cidr = "10.0.4.0/24"
        az = "ap-northeast-1a"
      },
      app_1c = {
        name = "menta_app_1c"
        cidr = "10.0.104.0/24"
        az = "ap-northeast-1c"
      },
    },
    private_subnets = {
      private_1a = {
        name = "menta_private_1a"
        cidr = "10.0.1.0/24"
        az = "ap-northeast-1a"
      },
      private_1c = {
        name = "menta_private_1c"
        cidr = "10.0.101.0/24"
        az = "ap-northeast-1c"
      },
      rds_1a = {
        name = "menta_rds_1a"
        cidr = "10.0.51.0/24"
        az = "ap-northeast-1a"
      },
      rds_1c = {
        name = "menta_rds_1c"
        cidr = "10.0.151.0/24"
        az = "ap-northeast-1c"
      },
    }
  }
}

variable "ec2_type" {
  type = map(any)
  default = {
    ami = "ami-02c3627b04781eada",
    type = "t2.micro"
  }
}

variable "subnets_id" {
  default = {
    "0" = "subnet-049499484780887d1"
    "1" = "subnet-0478ebe4e376d1d64"
  }
}

variable "RDS_DB_NAME" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}

variable "firehose_delivery_streams" {
  default = [
    "menta-aws-practice-net-Nginx-access-PUT-S3",
    "menta-aws-practice-net-Nginx-error-PUT-S3",
    "menta-aws-practice-net-php-PUT-S3",
    "menta-aws-practice-net-RDS-audit-PUT-S3",
    "menta-aws-practice-net-RDS-slowquery-PUT-S3"
  ]
}

variable "cwl_log_groups" {
  default = [
    "menta-aws-practice.net_Nginx_access",
    "menta-aws-practice.net_Nginx_error",
    "menta-aws-practice.net_php-fpm",
    "/aws/rds/instance/terraform-20220618132312163100000003/audit",
    "/aws/rds/instance/terraform-20220618132312163100000003/slowquery"
  ]
}
