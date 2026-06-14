# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kendra_thesaurus                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_kendra_thesaurus" "this" {

  index_id           = ""     # string | required
  thesaurus_id       = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_at         = ""     # string | computed
  # description        = ""     # string | computed
  # error_message      = ""     # string | computed
  # file_size_bytes    = 0      # number | computed
  # name               = ""     # string | computed
  # role_arn           = ""     # string | computed
  # source_s3_path = [  # list(object)
  #   {
  #     bucket = ""
  #     key = ""
  #   }
  # ]
  # status             = ""     # string | computed
  # synonym_rule_count = 0      # number | computed
  # term_count         = 0      # number | computed
  # updated_at         = ""     # string | computed

}

