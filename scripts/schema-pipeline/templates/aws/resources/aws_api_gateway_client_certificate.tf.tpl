# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_client_certificate                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_client_certificate" "this" {

  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # created_date            = ""     # string | computed
  # expiration_date         = ""     # string | computed
  # pem_encoded_certificate = ""     # string | computed

}

