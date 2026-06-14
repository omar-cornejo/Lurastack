# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_efs_mount_target                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_efs_mount_target" "this" {

  access_point_id        = ""     # string | optional
  file_system_id         = ""     # string | optional+computed
  id                     = ""     # string | optional+computed
  mount_target_id        = ""     # string | optional+computed

  # availability_zone_id   = ""     # string | computed
  # availability_zone_name = ""     # string | computed
  # dns_name               = ""     # string | computed
  # file_system_arn        = ""     # string | computed
  # ip_address             = ""     # string | computed
  # mount_target_dns_name  = ""     # string | computed
  # network_interface_id   = ""     # string | computed
  # owner_id               = ""     # string | computed
  # security_groups        = []     # set(string) | computed
  # subnet_id              = ""     # string | computed

}

