# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_link                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_link" "this" {

  global_network_id = ""     # string | required
  link_id           = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # bandwidth = [  # list(object)
  #   {
  #     download_speed = 0
  #     upload_speed = 0
  #   }
  # ]
  # description       = ""     # string | computed
  # provider_name     = ""     # string | computed
  # site_id           = ""     # string | computed
  # type              = ""     # string | computed

}

