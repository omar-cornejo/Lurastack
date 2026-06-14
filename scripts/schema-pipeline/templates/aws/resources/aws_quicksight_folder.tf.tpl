# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_folder                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_folder" "this" {

  folder_id         = ""     # string | required
  aws_account_id    = ""     # string | optional+computed
  folder_type       = ""     # string | optional
  id                = ""     # string | optional+computed
  name              = ""     # string | optional
  parent_folder_arn = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_time      = ""     # string | computed
  # folder_path       = []     # list(string) | computed
  # last_updated_time = ""     # string | computed

  permissions { # set [0..64]
    actions   = []     # set(string) | required
    principal = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

