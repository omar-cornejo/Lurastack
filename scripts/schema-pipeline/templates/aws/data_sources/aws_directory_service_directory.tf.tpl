# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_directory_service_directory                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_directory_service_directory" "this" {

  directory_id      = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # access_url        = ""     # string | computed
  # alias             = ""     # string | computed
  # connect_settings = [  # list(object)
  #   {
  #     availability_zones = []  # set(string)
  #     connect_ips = []  # set(string)
  #     customer_dns_ips = []  # set(string)
  #     customer_username = ""
  #     subnet_ids = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]
  # description       = ""     # string | computed
  # dns_ip_addresses  = []     # set(string) | computed
  # edition           = ""     # string | computed
  # enable_sso        = false  # bool | computed
  # name              = ""     # string | computed
  # radius_settings = [  # list(object)
  #   {
  #     authentication_protocol = ""
  #     display_label = ""
  #     radius_port = 0
  #     radius_retries = 0
  #     radius_servers = []  # set(string)
  #     radius_timeout = 0
  #     use_same_username = false
  #   }
  # ]
  # security_group_id = ""     # string | computed
  # short_name        = ""     # string | computed
  # size              = ""     # string | computed
  # type              = ""     # string | computed
  # vpc_settings = [  # list(object)
  #   {
  #     availability_zones = []  # set(string)
  #     subnet_ids = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]

}

