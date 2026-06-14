# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appconfig_environments                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_appconfig_environments" "this" {

  application_id  = ""     # string | required
  id              = ""     # string | optional+computed

  # environment_ids = []     # set(string) | computed

}

