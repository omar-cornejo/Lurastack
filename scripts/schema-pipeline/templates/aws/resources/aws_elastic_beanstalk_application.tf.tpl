# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastic_beanstalk_application                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastic_beanstalk_application" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  appversion_lifecycle { # list [0..1]
    service_role          = ""     # string | required
    delete_source_from_s3 = false  # bool | optional
    max_age_in_days       = 0      # number | optional
    max_count             = 0      # number | optional

  }

}

