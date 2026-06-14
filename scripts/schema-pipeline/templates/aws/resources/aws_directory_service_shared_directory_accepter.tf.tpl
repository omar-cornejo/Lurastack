# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_shared_directory_accepter     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_shared_directory_accepter" "this" {

  shared_directory_id = ""     # string | required
  id                  = ""     # string | optional+computed

  # method              = ""     # string | computed
  # notes               = ""     # string | computed
  # owner_account_id    = ""     # string | computed
  # owner_directory_id  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

