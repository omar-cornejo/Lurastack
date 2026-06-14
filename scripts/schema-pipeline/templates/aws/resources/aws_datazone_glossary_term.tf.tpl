# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_glossary_term                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_glossary_term" "this" {

  glossary_identifier = ""     # string | required
  name                = ""     # string | required
  domain_identifier   = ""     # string | optional
  long_description    = ""     # string | optional
  short_description   = ""     # string | optional
  status              = ""     # string | optional

  # created_at          = ""     # string | computed
  # created_by          = ""     # string | computed
  # id                  = ""     # string | computed

  term_relations { # list
    classifies = []     # set(string) | optional
    is_a       = []     # set(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

