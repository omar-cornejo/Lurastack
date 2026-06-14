# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_infrastructure_configuration           │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_infrastructure_configuration" "this" {

  arn                           = ""     # string | required
  id                            = ""     # string | optional+computed
  resource_tags                 = {}     # map(string) | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # date_created                  = ""     # string | computed
  # date_updated                  = ""     # string | computed
  # description                   = ""     # string | computed
  # instance_metadata_options = [  # list(object)
  #   {
  #     http_put_response_hop_limit = 0
  #     http_tokens = ""
  #   }
  # ]
  # instance_profile_name         = ""     # string | computed
  # instance_types                = []     # set(string) | computed
  # key_pair                      = ""     # string | computed
  # logging = [  # list(object)
  #   {
  #     s3_logs = [  # list(object)
  #       {
  #         s3_bucket_name = ""
  #         s3_key_prefix = ""
  #       }
  #     ]
  #   }
  # ]
  # name                          = ""     # string | computed
  # placement = [  # list(object)
  #   {
  #     availability_zone = ""
  #     host_id = ""
  #     host_resource_group_arn = ""
  #     tenancy = ""
  #   }
  # ]
  # security_group_ids            = []     # set(string) | computed
  # sns_topic_arn                 = ""     # string | computed
  # subnet_id                     = ""     # string | computed
  # terminate_instance_on_failure = false  # bool | computed

}

