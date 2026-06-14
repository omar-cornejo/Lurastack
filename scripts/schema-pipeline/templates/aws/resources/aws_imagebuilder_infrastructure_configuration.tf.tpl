# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_infrastructure_configuration       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_infrastructure_configuration" "this" {

  instance_profile_name         = ""     # string | required
  name                          = ""     # string | required
  description                   = ""     # string | optional
  id                            = ""     # string | optional+computed
  instance_types                = []     # set(string) | optional
  key_pair                      = ""     # string | optional
  resource_tags                 = {}     # map(string) | optional
  security_group_ids            = []     # set(string) | optional
  sns_topic_arn                 = ""     # string | optional
  subnet_id                     = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  terminate_instance_on_failure = false  # bool | optional

  # arn                           = ""     # string | computed
  # date_created                  = ""     # string | computed
  # date_updated                  = ""     # string | computed

  instance_metadata_options { # list [0..1]
    http_put_response_hop_limit = 0      # number | optional
    http_tokens                 = ""     # string | optional

  }

  logging { # list [0..1]

    s3_logs { # list [1..1]
      s3_bucket_name = ""     # string | required
      s3_key_prefix  = ""     # string | optional

    }

  }

  placement { # list [0..1]
    availability_zone       = ""     # string | optional
    host_id                 = ""     # string | optional
    host_resource_group_arn = ""     # string | optional
    tenancy                 = ""     # string | optional

  }

}

