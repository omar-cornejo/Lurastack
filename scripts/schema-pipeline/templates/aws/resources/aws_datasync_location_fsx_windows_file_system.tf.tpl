# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_fsx_windows_file_system       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_fsx_windows_file_system" "this" {

  fsx_filesystem_arn  = ""     # string | required
  password            = ""     # string | required+sensitive
  security_group_arns = []     # set(string) | required
  user                = ""     # string | required
  domain              = ""     # string | optional
  id                  = ""     # string | optional+computed
  subdirectory        = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # creation_time       = ""     # string | computed
  # uri                 = ""     # string | computed

}

