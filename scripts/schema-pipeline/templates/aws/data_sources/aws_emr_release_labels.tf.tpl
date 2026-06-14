# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_emr_release_labels                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_emr_release_labels" "this" {

  id             = ""     # string | optional+computed

  # release_labels = []     # list(string) | computed

  filters { # list [0..1]
    application = ""     # string | optional
    prefix      = ""     # string | optional

  }

}

