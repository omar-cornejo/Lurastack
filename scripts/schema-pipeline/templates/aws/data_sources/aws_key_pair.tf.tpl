# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_key_pair                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_key_pair" "this" {

  id                 = ""     # string | optional+computed
  include_public_key = false  # bool | optional
  key_name           = ""     # string | optional
  key_pair_id        = ""     # string | optional
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # create_time        = ""     # string | computed
  # fingerprint        = ""     # string | computed
  # key_type           = ""     # string | computed
  # public_key         = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

