# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_realtime_log_config                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_realtime_log_config" "this" {

  name          = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # endpoint = [  # list(object)
  #   {
  #     kinesis_stream_config = [  # list(object)
  #       {
  #         role_arn = ""
  #         stream_arn = ""
  #       }
  #     ]
  #     stream_type = ""
  #   }
  # ]
  # fields        = []     # set(string) | computed
  # sampling_rate = 0      # number | computed

}

