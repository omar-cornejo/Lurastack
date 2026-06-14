# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_endpoint_access              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_endpoint_access" "this" {

  endpoint_name          = ""     # string | required
  subnet_ids             = []     # set(string) | required
  workgroup_name         = ""     # string | required
  id                     = ""     # string | optional+computed
  owner_account          = ""     # string | optional
  vpc_security_group_ids = []     # set(string) | optional+computed

  # address                = ""     # string | computed
  # arn                    = ""     # string | computed
  # port                   = 0      # number | computed
  # vpc_endpoint = [  # list(object)
  #   {
  #     network_interface = [  # list(object)
  #       {
  #         availability_zone = ""
  #         network_interface_id = ""
  #         private_ip_address = ""
  #         subnet_id = ""
  #       }
  #     ]
  #     vpc_endpoint_id = ""
  #     vpc_id = ""
  #   }
  # ]

}

