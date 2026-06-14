# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_ml_transform                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_ml_transform" "this" {

  name              = ""     # string | required
  role_arn          = ""     # string | required
  description       = ""     # string | optional
  glue_version      = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  max_capacity      = 0      # number | optional+computed
  max_retries       = 0      # number | optional
  number_of_workers = 0      # number | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  timeout           = 0      # number | optional
  worker_type       = ""     # string | optional

  # arn               = ""     # string | computed
  # label_count       = 0      # number | computed
  # schema = [  # list(object)
  #   {
  #     data_type = ""
  #     name = ""
  #   }
  # ]

  input_record_tables { # list [1..*]
    database_name   = ""     # string | required
    table_name      = ""     # string | required
    catalog_id      = ""     # string | optional
    connection_name = ""     # string | optional

  }

  parameters { # list [1..1]
    transform_type = ""     # string | required

    find_matches_parameters { # list [1..1]
      accuracy_cost_trade_off    = 0      # number | optional
      enforce_provided_labels    = false  # bool | optional
      precision_recall_trade_off = 0      # number | optional
      primary_key_column_name    = ""     # string | optional

    }

  }

}

