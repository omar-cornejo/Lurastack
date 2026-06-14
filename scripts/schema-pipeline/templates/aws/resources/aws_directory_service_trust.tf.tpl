# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_trust                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_trust" "this" {

  directory_id                            = ""     # string | required
  remote_domain_name                      = ""     # string | required
  trust_direction                         = ""     # string | required
  trust_password                          = ""     # string | required
  conditional_forwarder_ip_addrs          = []     # set(string) | optional
  delete_associated_conditional_forwarder = false  # bool | optional+computed
  selective_auth                          = ""     # string | optional+computed
  trust_type                              = ""     # string | optional+computed

  # created_date_time                       = ""     # string | computed
  # id                                      = ""     # string | computed
  # last_updated_date_time                  = ""     # string | computed
  # state_last_updated_date_time            = ""     # string | computed
  # trust_state                             = ""     # string | computed
  # trust_state_reason                      = ""     # string | computed

}

