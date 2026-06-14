# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_notebook_instance                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_notebook_instance" "this" {

  instance_type                = ""     # string | required
  name                         = ""     # string | required
  role_arn                     = ""     # string | required
  accelerator_types            = []     # set(string) | optional+DEPRECATED
  additional_code_repositories = []     # set(string) | optional
  default_code_repository      = ""     # string | optional
  direct_internet_access       = ""     # string | optional
  id                           = ""     # string | optional+computed
  kms_key_id                   = ""     # string | optional
  lifecycle_config_name        = ""     # string | optional
  platform_identifier          = ""     # string | optional+computed
  root_access                  = ""     # string | optional
  security_groups              = []     # set(string) | optional+computed
  subnet_id                    = ""     # string | optional
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed
  volume_size                  = 0      # number | optional

  # arn                          = ""     # string | computed
  # network_interface_id         = ""     # string | computed
  # url                          = ""     # string | computed

  instance_metadata_service_configuration { # list [0..1]
    minimum_instance_metadata_service_version = ""     # string | optional+computed

  }

}

