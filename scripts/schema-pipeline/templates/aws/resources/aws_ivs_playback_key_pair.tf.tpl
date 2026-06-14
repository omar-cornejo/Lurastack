# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ivs_playback_key_pair                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ivs_playback_key_pair" "this" {

  public_key  = ""     # string | required
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # fingerprint = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

