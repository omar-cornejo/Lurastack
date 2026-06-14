# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpc_endpoint_associations                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpc_endpoint_associations" "this" {

  vpc_endpoint_id = ""     # string | required

  # associations = [  # list(object)
  #   {
  #     associated_resource_accessibility = ""
  #     associated_resource_arn = ""
  #     dns_entry = [  # list(object)
  #       {
  #         dns_name = ""
  #         hosted_zone_id = ""
  #       }
  #     ]
  #     id = ""
  #     private_dns_entry = [  # list(object)
  #       {
  #         dns_name = ""
  #         hosted_zone_id = ""
  #       }
  #     ]
  #     resource_configuration_group_arn = ""
  #     service_network_arn = ""
  #     service_network_name = ""
  #     tags = {}  # map(string)
  #   }
  # ]

}

