# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_zone                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_zone" "this" {

  id                         = ""     # string | optional+computed
  name                       = ""     # string | optional+computed
  private_zone               = false  # bool | optional
  tags                       = {}     # map(string) | optional+computed
  vpc_id                     = ""     # string | optional+computed
  zone_id                    = ""     # string | optional+computed

  # arn                        = ""     # string | computed
  # caller_reference           = ""     # string | computed
  # comment                    = ""     # string | computed
  # linked_service_description = ""     # string | computed
  # linked_service_principal   = ""     # string | computed
  # name_servers               = []     # list(string) | computed
  # primary_name_server        = ""     # string | computed
  # resource_record_set_count  = 0      # number | computed

}

