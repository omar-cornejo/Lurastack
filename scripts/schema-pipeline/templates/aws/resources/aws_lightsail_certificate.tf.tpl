# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_certificate                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_certificate" "this" {

  name                      = ""     # string | required
  domain_name               = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  subject_alternative_names = []     # set(string) | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # created_at                = ""     # string | computed
  # domain_validation_options = [  # set(object)
  #   {
  #     domain_name = ""
  #     resource_record_name = ""
  #     resource_record_type = ""
  #     resource_record_value = ""
  #   }
  # ]

}

