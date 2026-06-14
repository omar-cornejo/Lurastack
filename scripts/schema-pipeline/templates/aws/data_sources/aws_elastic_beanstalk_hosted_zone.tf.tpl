# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elastic_beanstalk_hosted_zone                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_elastic_beanstalk_hosted_zone" "this" {

  id     = ""     # string | optional+computed
  region = ""     # string | optional

}

