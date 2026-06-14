# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_mskconnect_worker_configuration                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_mskconnect_worker_configuration" "this" {

  name                    = ""     # string | required
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # description             = ""     # string | computed
  # latest_revision         = 0      # number | computed
  # properties_file_content = ""     # string | computed

}

