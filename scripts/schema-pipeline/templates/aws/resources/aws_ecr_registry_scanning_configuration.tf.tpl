# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_registry_scanning_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_registry_scanning_configuration" "this" {

  scan_type   = ""     # string | required
  id          = ""     # string | optional+computed

  # registry_id = ""     # string | computed

  rule { # set [0..100]
    scan_frequency = ""     # string | required

    repository_filter { # set [1..*]
      filter      = ""     # string | required
      filter_type = ""     # string | required

    }

  }

}

