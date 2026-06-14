# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_service_discovery_instance                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_service_discovery_instance" "this" {

  attributes  = {}     # map(string) | required
  instance_id = ""     # string | required
  service_id  = ""     # string | required
  id          = ""     # string | optional+computed

}

