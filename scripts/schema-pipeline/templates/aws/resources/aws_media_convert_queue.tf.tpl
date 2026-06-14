# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_media_convert_queue                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_media_convert_queue" "this" {

  name            = ""     # string | required
  concurrent_jobs = 0      # number | optional+computed
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  pricing_plan    = ""     # string | optional
  status          = ""     # string | optional
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed

  reservation_plan_settings { # list [0..1]
    commitment     = ""     # string | required
    renewal_type   = ""     # string | required
    reserved_slots = 0      # number | required

  }

}

