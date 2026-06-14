# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_dev_endpoint                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_dev_endpoint" "this" {

  name                                   = ""     # string | required
  role_arn                               = ""     # string | required
  arguments                              = {}     # map(string) | optional
  extra_jars_s3_path                     = ""     # string | optional
  extra_python_libs_s3_path              = ""     # string | optional
  glue_version                           = ""     # string | optional
  id                                     = ""     # string | optional+computed
  number_of_nodes                        = 0      # number | optional
  number_of_workers                      = 0      # number | optional
  public_key                             = ""     # string | optional
  public_keys                            = []     # set(string) | optional
  security_configuration                 = ""     # string | optional
  security_group_ids                     = []     # set(string) | optional
  subnet_id                              = ""     # string | optional
  tags                                   = {}     # map(string) | optional
  tags_all                               = {}     # map(string) | optional+computed
  worker_type                            = ""     # string | optional

  # arn                                    = ""     # string | computed
  # availability_zone                      = ""     # string | computed
  # failure_reason                         = ""     # string | computed
  # private_address                        = ""     # string | computed
  # public_address                         = ""     # string | computed
  # status                                 = ""     # string | computed
  # vpc_id                                 = ""     # string | computed
  # yarn_endpoint_address                  = ""     # string | computed
  # zeppelin_remote_spark_interpreter_port = 0      # number | computed

}

