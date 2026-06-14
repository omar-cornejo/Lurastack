# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chimesdkvoice_global_settings                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chimesdkvoice_global_settings" "this" {

  id = ""     # string | optional+computed

  voice_connector { # list [1..1]
    cdr_bucket = ""     # string | optional

  }

}

