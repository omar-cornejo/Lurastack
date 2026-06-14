# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kendra_query_suggestions_block_list                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_kendra_query_suggestions_block_list" "this" {

  index_id                        = ""     # string | required
  query_suggestions_block_list_id = ""     # string | required
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # created_at                      = ""     # string | computed
  # description                     = ""     # string | computed
  # error_message                   = ""     # string | computed
  # file_size_bytes                 = 0      # number | computed
  # item_count                      = 0      # number | computed
  # name                            = ""     # string | computed
  # role_arn                        = ""     # string | computed
  # source_s3_path = [  # list(object)
  #   {
  #     bucket = ""
  #     key = ""
  #   }
  # ]
  # status                          = ""     # string | computed
  # updated_at                      = ""     # string | computed

}

