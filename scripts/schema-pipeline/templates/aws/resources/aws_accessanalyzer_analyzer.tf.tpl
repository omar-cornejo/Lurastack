# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_accessanalyzer_analyzer                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_accessanalyzer_analyzer" "this" {

  analyzer_name = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed
  type          = ""     # string | optional

  # arn           = ""     # string | computed

  configuration { # list [0..1]

    unused_access { # list [0..1]
      unused_access_age = 0      # number | optional

      analysis_rule { # list [0..1]

        exclusion { # list
          account_ids   = []     # list(string) | optional
          resource_tags = []     # list(map(string)) | optional

        }

      }

    }

  }

}

