# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kendra_faq                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_kendra_faq" "this" {

  faq_id        = ""     # string | required
  index_id      = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # created_at    = ""     # string | computed
  # description   = ""     # string | computed
  # error_message = ""     # string | computed
  # file_format   = ""     # string | computed
  # language_code = ""     # string | computed
  # name          = ""     # string | computed
  # role_arn      = ""     # string | computed
  # s3_path = [  # list(object)
  #   {
  #     bucket = ""
  #     key = ""
  #   }
  # ]
  # status        = ""     # string | computed
  # updated_at    = ""     # string | computed

}

