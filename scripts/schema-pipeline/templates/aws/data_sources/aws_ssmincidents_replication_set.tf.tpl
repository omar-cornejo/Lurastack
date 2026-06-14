# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmincidents_replication_set                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmincidents_replication_set" "this" {

  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_by         = ""     # string | computed
  # deletion_protected = false  # bool | computed
  # last_modified_by   = ""     # string | computed
  # region = [  # set(object)
  #   {
  #     kms_key_arn = ""
  #     name = ""
  #     status = ""
  #     status_message = ""
  #   }
  # ]
  # status             = ""     # string | computed

}

