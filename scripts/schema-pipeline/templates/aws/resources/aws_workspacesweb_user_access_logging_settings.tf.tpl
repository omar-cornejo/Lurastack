# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_user_access_logging_settings      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_user_access_logging_settings" "this" {

  kinesis_stream_arn               = ""     # string | required
  tags                             = {}     # map(string) | optional

  # associated_portal_arns           = []     # list(string) | computed
  # tags_all                         = {}     # map(string) | computed
  # user_access_logging_settings_arn = ""     # string | computed

}

