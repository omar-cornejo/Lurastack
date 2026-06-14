# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_polly_voices                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_polly_voices" "this" {

  engine                            = ""     # string | optional
  include_additional_language_codes = false  # bool | optional
  language_code                     = ""     # string | optional

  # id                                = ""     # string | computed

  voices { # list

    # additional_language_codes = []     # list(string) | computed
    # gender                    = ""     # string | computed
    # id                        = ""     # string | computed
    # language_code             = ""     # string | computed
    # language_name             = ""     # string | computed
    # name                      = ""     # string | computed
    # supported_engines         = []     # list(string) | computed

  }

}

