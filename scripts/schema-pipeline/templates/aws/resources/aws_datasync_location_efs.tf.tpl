# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_efs                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_efs" "this" {

  efs_file_system_arn         = ""     # string | required
  access_point_arn            = ""     # string | optional
  file_system_access_role_arn = ""     # string | optional
  id                          = ""     # string | optional+computed
  in_transit_encryption       = ""     # string | optional
  subdirectory                = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # uri                         = ""     # string | computed

  ec2_config { # list [1..1]
    security_group_arns = []     # set(string) | required
    subnet_arn          = ""     # string | required

  }

}

