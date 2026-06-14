# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_virtual_mfa_device                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_virtual_mfa_device" "this" {

  virtual_mfa_device_name = ""     # string | required
  id                      = ""     # string | optional+computed
  path                    = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # base_32_string_seed     = ""     # string | computed
  # enable_date             = ""     # string | computed
  # qr_code_png             = ""     # string | computed
  # user_name               = ""     # string | computed

}

