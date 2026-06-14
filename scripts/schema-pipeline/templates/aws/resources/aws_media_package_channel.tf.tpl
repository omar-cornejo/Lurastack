# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_media_package_channel                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_media_package_channel" "this" {

  channel_id  = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # hls_ingest = [  # list(object)
  #   {
  #     ingest_endpoints = [  # list(object)
  #       {
  #         password = ""
  #         url = ""
  #         username = ""
  #       }
  #     ]
  #   }
  # ]

}

