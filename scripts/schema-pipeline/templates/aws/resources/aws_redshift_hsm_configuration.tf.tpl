# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_hsm_configuration                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_hsm_configuration" "this" {

  description                   = ""     # string | required
  hsm_configuration_identifier  = ""     # string | required
  hsm_ip_address                = ""     # string | required
  hsm_partition_name            = ""     # string | required
  hsm_partition_password        = ""     # string | required+sensitive
  hsm_server_public_certificate = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed

}

