# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_engine_version                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_engine_version" "this" {

  engine                                        = ""     # string | required
  default_only                                  = false  # bool | optional
  has_major_target                              = false  # bool | optional
  has_minor_target                              = false  # bool | optional
  id                                            = ""     # string | optional+computed
  include_all                                   = false  # bool | optional
  latest                                        = false  # bool | optional
  parameter_group_family                        = ""     # string | optional+computed
  preferred_major_targets                       = []     # list(string) | optional
  preferred_upgrade_targets                     = []     # list(string) | optional
  preferred_versions                            = []     # list(string) | optional
  version                                       = ""     # string | optional+computed

  # default_character_set                         = ""     # string | computed
  # engine_description                            = ""     # string | computed
  # exportable_log_types                          = []     # set(string) | computed
  # status                                        = ""     # string | computed
  # supported_character_sets                      = []     # set(string) | computed
  # supported_feature_names                       = []     # set(string) | computed
  # supported_modes                               = []     # set(string) | computed
  # supported_timezones                           = []     # set(string) | computed
  # supports_certificate_rotation_without_restart = false  # bool | computed
  # supports_global_databases                     = false  # bool | computed
  # supports_integrations                         = false  # bool | computed
  # supports_limitless_database                   = false  # bool | computed
  # supports_local_write_forwarding               = false  # bool | computed
  # supports_log_exports_to_cloudwatch            = false  # bool | computed
  # supports_parallel_query                       = false  # bool | computed
  # supports_read_replica                         = false  # bool | computed
  # valid_major_targets                           = []     # set(string) | computed
  # valid_minor_targets                           = []     # set(string) | computed
  # valid_upgrade_targets                         = []     # set(string) | computed
  # version_actual                                = ""     # string | computed
  # version_description                           = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

