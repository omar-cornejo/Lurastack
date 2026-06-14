# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_acl                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_acl" "this" {

  vpc_id     = ""     # string | required
  egress     = []     # set(object({ action: string, cidr_block: string, from_port: number, icmp_code: number, icmp_type: number, ipv6_cidr_block: string, protocol: string, rule_no: number, to_port: number })) | optional+computed
  id         = ""     # string | optional+computed
  ingress    = []     # set(object({ action: string, cidr_block: string, from_port: number, icmp_code: number, icmp_type: number, ipv6_cidr_block: string, protocol: string, rule_no: number, to_port: number })) | optional+computed
  subnet_ids = []     # set(string) | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed
  # owner_id   = ""     # string | computed

}

