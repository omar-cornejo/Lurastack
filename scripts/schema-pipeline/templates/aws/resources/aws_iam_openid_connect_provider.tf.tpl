# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_openid_connect_provider                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_openid_connect_provider" "this" {

  client_id_list  = []     # set(string) | required
  url             = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed
  thumbprint_list = []     # list(string) | optional+computed

  # arn             = ""     # string | computed

}

