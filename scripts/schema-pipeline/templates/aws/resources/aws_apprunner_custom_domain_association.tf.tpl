# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_custom_domain_association             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_custom_domain_association" "this" {

  domain_name                    = ""     # string | required
  service_arn                    = ""     # string | required
  enable_www_subdomain           = false  # bool | optional
  id                             = ""     # string | optional+computed

  # certificate_validation_records = [  # set(object)
  #   {
  #     name = ""
  #     status = ""
  #     type = ""
  #     value = ""
  #   }
  # ]
  # dns_target                     = ""     # string | computed
  # status                         = ""     # string | computed

}

