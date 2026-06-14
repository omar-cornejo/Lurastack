# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elb_attachment                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elb_attachment" "this" {

  elb      = ""     # string | required
  instance = ""     # string | required
  id       = ""     # string | optional+computed

}

