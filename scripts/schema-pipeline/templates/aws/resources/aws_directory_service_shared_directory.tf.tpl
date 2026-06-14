# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_shared_directory              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_shared_directory" "this" {

  directory_id        = ""     # string | required
  id                  = ""     # string | optional+computed
  method              = ""     # string | optional
  notes               = ""     # string | optional+sensitive

  # shared_directory_id = ""     # string | computed

  target { # list [1..1]
    id   = ""     # string | required
    type = ""     # string | optional

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

