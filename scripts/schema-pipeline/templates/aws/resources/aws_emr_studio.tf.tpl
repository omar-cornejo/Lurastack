# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_studio                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_studio" "this" {

  auth_mode                      = ""     # string | required
  default_s3_location            = ""     # string | required
  engine_security_group_id       = ""     # string | required
  name                           = ""     # string | required
  service_role                   = ""     # string | required
  subnet_ids                     = []     # set(string) | required
  vpc_id                         = ""     # string | required
  workspace_security_group_id    = ""     # string | required
  description                    = ""     # string | optional
  encryption_key_arn             = ""     # string | optional
  id                             = ""     # string | optional+computed
  idp_auth_url                   = ""     # string | optional
  idp_relay_state_parameter_name = ""     # string | optional
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed
  user_role                      = ""     # string | optional

  # arn                            = ""     # string | computed
  # url                            = ""     # string | computed

}

