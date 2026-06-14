# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_spanner_instance                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_spanner_instance" "this" {

  name                         = ""     # string | required | A unique identifier for the instance, which cannot be change…
  config                       = ""     # string | optional | The name of the instance's configuration (similar but not qu…
  display_name                 = ""     # string | optional | The descriptive name for this instance as it appears in UIs.…
  id                           = ""     # string | optional+computed
  project                      = ""     # string | optional

  # autoscaling_config = [  # list(object)
  #   {
  #     autoscaling_limits = [  # list(object)
  #       {
  #         max_nodes = 0
  #         max_processing_units = 0
  #         min_nodes = 0
  #         min_processing_units = 0
  #       }
  #     ]
  #     autoscaling_targets = [  # list(object)
  #       {
  #         high_priority_cpu_utilization_percent = 0
  #         storage_utilization_percent = 0
  #       }
  #     ]
  #   }
  # ]
  # default_backup_schedule_type = ""     # string | computed | Controls the default backup behavior for new databases withi…
  # effective_labels             = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # force_destroy                = false  # bool | computed | When deleting a spanner instance, this boolean option will d…
  # labels                       = {}     # map(string) | computed | An object containing a list of "key": value pairs. Example: …
  # num_nodes                    = 0      # number | computed | The number of nodes allocated to this instance. Exactly one …
  # processing_units             = 0      # number | computed | The number of processing units allocated to this instance. E…
  # state                        = ""     # string | computed | Instance status: 'CREATING' or 'READY'.
  # terraform_labels             = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

