# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_directory                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_directory" "this" {

  name                                 = ""     # string | required
  password                             = ""     # string | required+sensitive
  alias                                = ""     # string | optional+computed
  description                          = ""     # string | optional
  desired_number_of_domain_controllers = 0      # number | optional+computed
  edition                              = ""     # string | optional+computed
  enable_sso                           = false  # bool | optional
  id                                   = ""     # string | optional+computed
  short_name                           = ""     # string | optional+computed
  size                                 = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed
  type                                 = ""     # string | optional

  # access_url                           = ""     # string | computed
  # dns_ip_addresses                     = []     # set(string) | computed
  # security_group_id                    = ""     # string | computed

  connect_settings { # list [0..1]
    customer_dns_ips   = []     # set(string) | required
    customer_username  = ""     # string | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required

    # availability_zones = []     # set(string) | computed
    # connect_ips        = []     # set(string) | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_settings { # list [0..1]
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required

    # availability_zones = []     # set(string) | computed

  }

}

