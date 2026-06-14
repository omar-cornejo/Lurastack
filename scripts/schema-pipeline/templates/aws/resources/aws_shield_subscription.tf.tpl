# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_subscription                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_subscription" "this" {

  auto_renew   = ""     # string | optional+computed | Whether to automatically renew the subscription when it expi…
  skip_destroy = false  # bool | optional

  # id           = ""     # string | computed

}

