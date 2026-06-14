# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dx_router_configuration                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_dx_router_configuration" "this" {

  router_type_identifier = ""     # string | required
  virtual_interface_id   = ""     # string | required
  id                     = ""     # string | optional+computed

  # customer_router_config = ""     # string | computed
  # router = [  # list(object)
  #   {
  #     platform = ""
  #     router_type_identifier = ""
  #     software = ""
  #     vendor = ""
  #     xslt_template_name = ""
  #     xslt_template_name_for_mac_sec = ""
  #   }
  # ]
  # virtual_interface_name = ""     # string | computed

}

