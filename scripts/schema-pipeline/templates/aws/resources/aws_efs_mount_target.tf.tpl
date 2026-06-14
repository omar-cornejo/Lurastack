# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_mount_target                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_mount_target" "this" {

  file_system_id         = ""     # string | required
  subnet_id              = ""     # string | required
  id                     = ""     # string | optional+computed
  ip_address             = ""     # string | optional+computed
  security_groups        = []     # set(string) | optional+computed

  # availability_zone_id   = ""     # string | computed
  # availability_zone_name = ""     # string | computed
  # dns_name               = ""     # string | computed
  # file_system_arn        = ""     # string | computed
  # mount_target_dns_name  = ""     # string | computed
  # network_interface_id   = ""     # string | computed
  # owner_id               = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

