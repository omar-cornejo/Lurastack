# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dynamodb_global_table                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dynamodb_global_table" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  replica { # set [1..*]
    region_name = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

