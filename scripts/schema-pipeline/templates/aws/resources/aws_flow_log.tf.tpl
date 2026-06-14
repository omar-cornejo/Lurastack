# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_flow_log                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_flow_log" "this" {

  deliver_cross_account_role    = ""     # string | optional
  eni_id                        = ""     # string | optional
  iam_role_arn                  = ""     # string | optional
  id                            = ""     # string | optional+computed
  log_destination               = ""     # string | optional+computed
  log_destination_type          = ""     # string | optional
  log_format                    = ""     # string | optional+computed
  log_group_name                = ""     # string | optional+computed+DEPRECATED
  max_aggregation_interval      = 0      # number | optional
  subnet_id                     = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  traffic_type                  = ""     # string | optional
  transit_gateway_attachment_id = ""     # string | optional
  transit_gateway_id            = ""     # string | optional
  vpc_id                        = ""     # string | optional

  # arn                           = ""     # string | computed

  destination_options { # list [0..1]
    file_format                = ""     # string | optional
    hive_compatible_partitions = false  # bool | optional
    per_hour_partition         = false  # bool | optional

  }

}

