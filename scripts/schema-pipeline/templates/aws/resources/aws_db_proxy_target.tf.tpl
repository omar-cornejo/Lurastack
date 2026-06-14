# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_proxy_target                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_proxy_target" "this" {

  db_proxy_name          = ""     # string | required
  target_group_name      = ""     # string | required
  db_cluster_identifier  = ""     # string | optional
  db_instance_identifier = ""     # string | optional
  id                     = ""     # string | optional+computed

  # endpoint               = ""     # string | computed
  # port                   = 0      # number | computed
  # rds_resource_id        = ""     # string | computed
  # target_arn             = ""     # string | computed
  # tracked_cluster_id     = ""     # string | computed
  # type                   = ""     # string | computed

}

