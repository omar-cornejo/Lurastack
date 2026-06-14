# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_qldb_stream                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_qldb_stream" "this" {

  inclusive_start_time = ""     # string | required
  ledger_name          = ""     # string | required
  role_arn             = ""     # string | required
  stream_name          = ""     # string | required
  exclusive_end_time   = ""     # string | optional
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  kinesis_configuration { # list [1..1]
    stream_arn          = ""     # string | required
    aggregation_enabled = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

