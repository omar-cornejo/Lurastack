# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_security_configuration                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_security_configuration" "this" {

  configuration = ""     # string | required
  id            = ""     # string | optional+computed
  name          = ""     # string | optional+computed
  name_prefix   = ""     # string | optional+computed

  # creation_date = ""     # string | computed

}

