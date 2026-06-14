# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_synthetics_runtime_versions                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_synthetics_runtime_versions" "this" {


  # id = ""     # string | computed

  runtime_versions { # list

    # deprecation_date = ""     # string | computed
    # description      = ""     # string | computed
    # release_date     = ""     # string | computed
    # version_name     = ""     # string | computed

  }

}

