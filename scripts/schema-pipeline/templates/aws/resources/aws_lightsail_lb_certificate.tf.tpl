# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb_certificate                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb_certificate" "this" {

  lb_name                   = ""     # string | required
  name                      = ""     # string | required
  domain_name               = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  subject_alternative_names = []     # set(string) | optional+computed

  # arn                       = ""     # string | computed
  # created_at                = ""     # string | computed
  # domain_validation_records = [  # set(object)
  #   {
  #     domain_name = ""
  #     resource_record_name = ""
  #     resource_record_type = ""
  #     resource_record_value = ""
  #   }
  # ]
  # support_code              = ""     # string | computed

}

