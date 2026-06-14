# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cleanrooms_configured_table                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cleanrooms_configured_table" "this" {

  allowed_columns = []     # set(string) | required
  analysis_method = ""     # string | required
  name            = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # create_time     = ""     # string | computed
  # update_time     = ""     # string | computed

  table_reference { # list [1..1]
    database_name = ""     # string | required
    table_name    = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

