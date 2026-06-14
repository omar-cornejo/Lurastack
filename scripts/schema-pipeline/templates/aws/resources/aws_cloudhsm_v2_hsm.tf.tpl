# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudhsm_v2_hsm                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudhsm_v2_hsm" "this" {

  cluster_id        = ""     # string | required
  availability_zone = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  ip_address        = ""     # string | optional+computed
  subnet_id         = ""     # string | optional+computed

  # hsm_eni_id        = ""     # string | computed
  # hsm_id            = ""     # string | computed
  # hsm_state         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

