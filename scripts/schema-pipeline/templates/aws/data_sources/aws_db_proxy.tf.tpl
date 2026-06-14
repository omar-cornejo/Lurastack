# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_proxy                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_proxy" "this" {

  name                   = ""     # string | required
  id                     = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # auth = [  # set(object)
  #   {
  #     auth_scheme = ""
  #     client_password_auth_type = ""
  #     description = ""
  #     iam_auth = ""
  #     secret_arn = ""
  #     username = ""
  #   }
  # ]
  # debug_logging          = false  # bool | computed
  # endpoint               = ""     # string | computed
  # engine_family          = ""     # string | computed
  # idle_client_timeout    = 0      # number | computed
  # require_tls            = false  # bool | computed
  # role_arn               = ""     # string | computed
  # vpc_id                 = ""     # string | computed
  # vpc_security_group_ids = []     # set(string) | computed
  # vpc_subnet_ids         = []     # set(string) | computed

}

