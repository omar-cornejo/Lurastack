# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_network_insights_analysis                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_network_insights_analysis" "this" {

  id                           = ""     # string | optional+computed
  network_insights_analysis_id = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  # alternate_path_hints = [  # list(object)
  #   {
  #     component_arn = ""
  #     component_id = ""
  #   }
  # ]
  # arn                          = ""     # string | computed
  # explanations = [  # list(object)
  #   {
  #     acl = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     acl_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         egress = false
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         rule_action = ""
  #         rule_number = 0
  #       }
  #     ]
  #     address = ""
  #     addresses = []  # list(string)
  #     attached_to = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     availability_zones = []  # list(string)
  #     cidrs = []  # list(string)
  #     classic_load_balancer_listener = [  # list(object)
  #       {
  #         instance_port = 0
  #         load_balancer_port = 0
  #       }
  #     ]
  #     component = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     customer_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     destination = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     destination_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     direction = ""
  #     elastic_load_balancer_listener = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     explanation_code = ""
  #     ingress_route_table = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     internet_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     load_balancer_arn = ""
  #     load_balancer_listener_port = 0
  #     load_balancer_target_group = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     load_balancer_target_groups = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     load_balancer_target_port = 0
  #     missing_component = ""
  #     nat_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     network_interface = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     packet_field = ""
  #     port = 0
  #     port_ranges = [  # list(object)
  #       {
  #         from = 0
  #         to = 0
  #       }
  #     ]
  #     prefix_list = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     protocols = []  # list(string)
  #     route_table = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     route_table_route = [  # list(object)
  #       {
  #         destination_cidr = ""
  #         destination_prefix_list_id = ""
  #         egress_only_internet_gateway_id = ""
  #         gateway_id = ""
  #         instance_id = ""
  #         nat_gateway_id = ""
  #         network_interface_id = ""
  #         origin = ""
  #         transit_gateway_id = ""
  #         vpc_peering_connection_id = ""
  #       }
  #     ]
  #     security_group = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     security_group_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         direction = ""
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         prefix_list_id = ""
  #         protocol = ""
  #         security_group_id = ""
  #       }
  #     ]
  #     security_groups = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     source_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     state = ""
  #     subnet = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     subnet_route_table = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway_attachment = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway_route_table = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway_route_table_route = [  # list(object)
  #       {
  #         attachment_id = ""
  #         destination_cidr = ""
  #         prefix_list_id = ""
  #         resource_id = ""
  #         resource_type = ""
  #         route_origin = ""
  #         state = ""
  #       }
  #     ]
  #     vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     vpc_endpoint = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     vpc_peering_connection = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     vpn_connection = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     vpn_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #   }
  # ]
  # filter_in_arns               = []     # list(string) | computed
  # forward_path_components = [  # list(object)
  #   {
  #     acl_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         egress = false
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         rule_action = ""
  #         rule_number = 0
  #       }
  #     ]
  #     additional_details = [  # list(object)
  #       {
  #         additional_detail_type = ""
  #         component = [  # list(object)
  #           {
  #             arn = ""
  #             id = ""
  #             name = ""
  #           }
  #         ]
  #       }
  #     ]
  #     attached_to = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     component = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     destination_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     inbound_header = [  # list(object)
  #       {
  #         destination_addresses = []  # list(string)
  #         destination_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         source_addresses = []  # list(string)
  #         source_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #       }
  #     ]
  #     outbound_header = [  # list(object)
  #       {
  #         destination_addresses = []  # list(string)
  #         destination_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         source_addresses = []  # list(string)
  #         source_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #       }
  #     ]
  #     route_table_route = [  # list(object)
  #       {
  #         destination_cidr = ""
  #         destination_prefix_list_id = ""
  #         egress_only_internet_gateway_id = ""
  #         gateway_id = ""
  #         instance_id = ""
  #         nat_gateway_id = ""
  #         network_interface_id = ""
  #         origin = ""
  #         transit_gateway_id = ""
  #         vpc_peering_connection_id = ""
  #       }
  #     ]
  #     security_group_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         direction = ""
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         prefix_list_id = ""
  #         protocol = ""
  #         security_group_id = ""
  #       }
  #     ]
  #     sequence_number = 0
  #     source_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     subnet = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway_route_table_route = [  # list(object)
  #       {
  #         attachment_id = ""
  #         destination_cidr = ""
  #         prefix_list_id = ""
  #         resource_id = ""
  #         resource_type = ""
  #         route_origin = ""
  #         state = ""
  #       }
  #     ]
  #     vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #   }
  # ]
  # network_insights_path_id     = ""     # string | computed
  # path_found                   = false  # bool | computed
  # return_path_components = [  # list(object)
  #   {
  #     acl_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         egress = false
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         rule_action = ""
  #         rule_number = 0
  #       }
  #     ]
  #     additional_details = [  # list(object)
  #       {
  #         additional_detail_type = ""
  #         component = [  # list(object)
  #           {
  #             arn = ""
  #             id = ""
  #             name = ""
  #           }
  #         ]
  #       }
  #     ]
  #     attached_to = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     component = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     destination_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     inbound_header = [  # list(object)
  #       {
  #         destination_addresses = []  # list(string)
  #         destination_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         source_addresses = []  # list(string)
  #         source_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #       }
  #     ]
  #     outbound_header = [  # list(object)
  #       {
  #         destination_addresses = []  # list(string)
  #         destination_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         protocol = ""
  #         source_addresses = []  # list(string)
  #         source_port_ranges = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #       }
  #     ]
  #     route_table_route = [  # list(object)
  #       {
  #         destination_cidr = ""
  #         destination_prefix_list_id = ""
  #         egress_only_internet_gateway_id = ""
  #         gateway_id = ""
  #         instance_id = ""
  #         nat_gateway_id = ""
  #         network_interface_id = ""
  #         origin = ""
  #         transit_gateway_id = ""
  #         vpc_peering_connection_id = ""
  #       }
  #     ]
  #     security_group_rule = [  # list(object)
  #       {
  #         cidr = ""
  #         direction = ""
  #         port_range = [  # list(object)
  #           {
  #             from = 0
  #             to = 0
  #           }
  #         ]
  #         prefix_list_id = ""
  #         protocol = ""
  #         security_group_id = ""
  #       }
  #     ]
  #     sequence_number = 0
  #     source_vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     subnet = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     transit_gateway_route_table_route = [  # list(object)
  #       {
  #         attachment_id = ""
  #         destination_cidr = ""
  #         prefix_list_id = ""
  #         resource_id = ""
  #         resource_type = ""
  #         route_origin = ""
  #         state = ""
  #       }
  #     ]
  #     vpc = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #   }
  # ]
  # start_date                   = ""     # string | computed
  # status                       = ""     # string | computed
  # status_message               = ""     # string | computed
  # warning_message              = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

