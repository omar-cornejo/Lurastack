# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_managed_scaling_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_managed_scaling_policy" "this" {

  cluster_id = ""     # string | required
  id         = ""     # string | optional+computed

  compute_limits { # set [1..*]
    maximum_capacity_units          = 0      # number | required
    minimum_capacity_units          = 0      # number | required
    unit_type                       = ""     # string | required
    maximum_core_capacity_units     = 0      # number | optional
    maximum_ondemand_capacity_units = 0      # number | optional

  }

}

