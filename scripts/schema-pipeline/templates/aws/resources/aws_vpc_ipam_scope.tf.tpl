# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_scope                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_scope" "this" {

  ipam_id         = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # ipam_arn        = ""     # string | computed
  # ipam_scope_type = ""     # string | computed
  # is_default      = false  # bool | computed
  # pool_count      = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

