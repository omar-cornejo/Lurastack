# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_activation                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_activation" "this" {

  iam_role           = ""     # string | required
  description        = ""     # string | optional
  expiration_date    = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional
  registration_limit = 0      # number | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # activation_code    = ""     # string | computed
  # expired            = false  # bool | computed
  # registration_count = 0      # number | computed

}

