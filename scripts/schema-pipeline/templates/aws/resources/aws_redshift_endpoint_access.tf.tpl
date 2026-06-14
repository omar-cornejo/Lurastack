# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_endpoint_access                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_endpoint_access" "this" {

  cluster_identifier     = ""     # string | required
  endpoint_name          = ""     # string | required
  subnet_group_name      = ""     # string | required
  id                     = ""     # string | optional+computed
  resource_owner         = ""     # string | optional+computed
  vpc_security_group_ids = []     # set(string) | optional+computed

  # address                = ""     # string | computed
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

