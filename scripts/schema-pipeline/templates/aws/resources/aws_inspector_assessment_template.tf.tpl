# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector_assessment_template                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector_assessment_template" "this" {

  duration           = 0      # number | required
  name               = ""     # string | required
  rules_package_arns = []     # set(string) | required
  target_arn         = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  event_subscription { # set
    event     = ""     # string | required
    topic_arn = ""     # string | required

  }

}

