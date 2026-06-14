# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_apprunner_hosted_zone_id                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_apprunner_hosted_zone_id" "this" {

  region = ""     # string | optional+computed

  # id     = ""     # string | computed

}

