# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_records                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_records" "this" {

  zone_id              = ""     # string | required
  name_regex           = ""     # string | optional

  # resource_record_sets = [  # list(object)
  #   {
  #     alias_target = {
  #       dns_name = ""
  #       evaluate_target_health = false
  #       hosted_zone_id = ""
  #     }
  #     cidr_routing_config = {
  #       collection_id = ""
  #       location_name = ""
  #     }
  #     failover = ""
  #     geolocation = {
  #       continent_code = ""
  #       country_code = ""
  #       subdivision_code = ""
  #     }
  #     geoproximity_location = {
  #       aws_region = ""
  #       bias = 0
  #       coordinates = {
  #         latitude = ""
  #         longitude = ""
  #       }
  #       local_zone_group = ""
  #     }
  #     health_check_id = ""
  #     multi_value_answer = false
  #     name = ""
  #     region = ""
  #     resource_records = [  # list(object)
  #       {
  #         value = ""
  #       }
  #     ]
  #     set_identifier = ""
  #     traffic_policy_instance_id = ""
  #     ttl = 0
  #     type = ""
  #     weight = 0
  #   }
  # ]

}

