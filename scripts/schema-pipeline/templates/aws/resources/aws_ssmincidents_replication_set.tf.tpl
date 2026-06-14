# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmincidents_replication_set                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmincidents_replication_set" "this" {

  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_by         = ""     # string | computed
  # deletion_protected = false  # bool | computed
  # last_modified_by   = ""     # string | computed
  # status             = ""     # string | computed

  region { # set [1..*]
    name           = ""     # string | required
    kms_key_arn    = ""     # string | optional

    # status         = ""     # string | computed
    # status_message = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

