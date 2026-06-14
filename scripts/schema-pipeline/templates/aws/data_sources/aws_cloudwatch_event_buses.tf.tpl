# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_event_buses                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_event_buses" "this" {

  name_prefix = ""     # string | optional

  # event_buses = [  # list(object)
  #   {
  #     arn = ""
  #     creation_time = ""
  #     description = ""
  #     last_modified_time = ""
  #     name = ""
  #     policy = ""
  #   }
  # ]

}

