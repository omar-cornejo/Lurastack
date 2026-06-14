# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_secret                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_secret" "this" {

  arn               = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  name              = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # created_date      = ""     # string | computed
  # description       = ""     # string | computed
  # kms_key_id        = ""     # string | computed
  # last_changed_date = ""     # string | computed
  # policy            = ""     # string | computed

}

