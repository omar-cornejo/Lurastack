# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_classifier                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_classifier" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  csv_classifier { # list [0..1]
    allow_single_column        = false  # bool | optional
    contains_header            = ""     # string | optional
    custom_datatype_configured = false  # bool | optional
    custom_datatypes           = []     # list(string) | optional
    delimiter                  = ""     # string | optional
    disable_value_trimming     = false  # bool | optional
    header                     = []     # list(string) | optional
    quote_symbol               = ""     # string | optional
    serde                      = ""     # string | optional+computed

  }

  grok_classifier { # list [0..1]
    classification  = ""     # string | required
    grok_pattern    = ""     # string | required
    custom_patterns = ""     # string | optional

  }

  json_classifier { # list [0..1]
    json_path = ""     # string | required

  }

  xml_classifier { # list [0..1]
    classification = ""     # string | required
    row_tag        = ""     # string | required

  }

}

