# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_resourcegroupstaggingapi_resources                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_resourcegroupstaggingapi_resources" "this" {

  exclude_compliant_resources = false  # bool | optional
  id                          = ""     # string | optional+computed
  include_compliance_details  = false  # bool | optional
  resource_arn_list           = []     # set(string) | optional
  resource_type_filters       = []     # set(string) | optional

  # resource_tag_mapping_list = [  # list(object)
  #   {
  #     compliance_details = [  # list(object)
  #       {
  #         compliance_status = false
  #         keys_with_noncompliant_values = []  # set(string)
  #         non_compliant_keys = []  # set(string)
  #       }
  #     ]
  #     resource_arn = ""
  #     tags = {}  # map(string)
  #   }
  # ]

  tag_filter { # list [0..50]
    key    = ""     # string | required
    values = []     # set(string) | optional

  }

}

