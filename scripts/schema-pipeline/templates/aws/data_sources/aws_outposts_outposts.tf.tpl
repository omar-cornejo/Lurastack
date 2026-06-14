# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_outposts                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_outposts" "this" {

  availability_zone    = ""     # string | optional+computed
  availability_zone_id = ""     # string | optional+computed
  id                   = ""     # string | optional+computed
  owner_id             = ""     # string | optional+computed
  site_id              = ""     # string | optional+computed

  # arns                 = []     # set(string) | computed
  # ids                  = []     # set(string) | computed

}

