# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_detective_invitation_accepter                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_detective_invitation_accepter" "this" {

  graph_arn = ""     # string | required
  id        = ""     # string | optional+computed

}

