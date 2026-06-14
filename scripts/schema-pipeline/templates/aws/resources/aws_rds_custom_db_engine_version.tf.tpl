# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_custom_db_engine_version                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_custom_db_engine_version" "this" {

  engine                                     = ""     # string | required
  engine_version                             = ""     # string | required
  database_installation_files_s3_bucket_name = ""     # string | optional
  database_installation_files_s3_prefix      = ""     # string | optional
  description                                = ""     # string | optional
  filename                                   = ""     # string | optional
  id                                         = ""     # string | optional+computed
  kms_key_id                                 = ""     # string | optional+computed
  manifest                                   = ""     # string | optional
  manifest_hash                              = ""     # string | optional
  source_image_id                            = ""     # string | optional
  status                                     = ""     # string | optional+computed
  tags                                       = {}     # map(string) | optional
  tags_all                                   = {}     # map(string) | optional+computed

  # arn                                        = ""     # string | computed
  # create_time                                = ""     # string | computed
  # db_parameter_group_family                  = ""     # string | computed
  # image_id                                   = ""     # string | computed
  # major_engine_version                       = ""     # string | computed
  # manifest_computed                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

