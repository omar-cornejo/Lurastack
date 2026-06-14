# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_key_pair                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_key_pair" "this" {

  public_key      = ""     # string | required
  id              = ""     # string | optional+computed
  key_name        = ""     # string | optional+computed
  key_name_prefix = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # fingerprint     = ""     # string | computed
  # key_pair_id     = ""     # string | computed
  # key_type        = ""     # string | computed

}

