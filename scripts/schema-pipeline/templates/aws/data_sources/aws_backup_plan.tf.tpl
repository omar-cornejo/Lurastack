# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_backup_plan                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_backup_plan" "this" {

  plan_id = ""     # string | required
  id      = ""     # string | optional+computed
  tags    = {}     # map(string) | optional+computed

  # arn     = ""     # string | computed
  # name    = ""     # string | computed
  # rule = [  # set(object)
  #   {
  #     completion_window = 0
  #     copy_action = [  # set(object)
  #       {
  #         destination_vault_arn = ""
  #         lifecycle = [  # list(object)
  #           {
  #             cold_storage_after = 0
  #             delete_after = 0
  #             opt_in_to_archive_for_supported_resources = false
  #           }
  #         ]
  #       }
  #     ]
  #     enable_continuous_backup = false
  #     lifecycle = [  # list(object)
  #       {
  #         cold_storage_after = 0
  #         delete_after = 0
  #         opt_in_to_archive_for_supported_resources = false
  #       }
  #     ]
  #     recovery_point_tags = {}  # map(string)
  #     rule_name = ""
  #     schedule = ""
  #     schedule_expression_timezone = ""
  #     start_window = 0
  #     target_vault_name = ""
  #   }
  # ]
  # version = ""     # string | computed

}

