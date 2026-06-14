# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_instance_group_manager                   │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_instance_group_manager" "this" {

  id                             = ""     # string | optional+computed
  name                           = ""     # string | optional | The name of the instance group manager. Must be 1-63 charact…
  project                        = ""     # string | optional | The ID of the project in which the resource belongs. If it i…
  self_link                      = ""     # string | optional | The URL of the created resource.
  zone                           = ""     # string | optional | The zone that instances in this group should be created in.

  # all_instances_config = [  # list(object)
  #   {
  #     labels = {}  # map(string)
  #     metadata = {}  # map(string)
  #   }
  # ]
  # auto_healing_policies = [  # list(object)
  #   {
  #     health_check = ""
  #     initial_delay_sec = 0
  #   }
  # ]
  # base_instance_name             = ""     # string | computed | The base instance name to use for instances in this group. T…
  # creation_timestamp             = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                    = ""     # string | computed | An optional textual description of the instance group manage…
  # fingerprint                    = ""     # string | computed | The fingerprint of the instance group manager.
  # instance_group                 = ""     # string | computed | The full URL of the instance group created by the manager.
  # instance_lifecycle_policy = [  # list(object)
  #   {
  #     default_action_on_failure = ""
  #     force_update_on_repair = ""
  #   }
  # ]
  # list_managed_instances_results = ""     # string | computed | Pagination behavior of the listManagedInstances API method f…
  # named_port = [  # set(object)
  #   {
  #     name = ""
  #     port = 0
  #   }
  # ]
  # operation                      = ""     # string | computed
  # stateful_disk = [  # set(object)
  #   {
  #     delete_rule = ""
  #     device_name = ""
  #   }
  # ]
  # stateful_external_ip = [  # list(object)
  #   {
  #     delete_rule = ""
  #     interface_name = ""
  #   }
  # ]
  # stateful_internal_ip = [  # list(object)
  #   {
  #     delete_rule = ""
  #     interface_name = ""
  #   }
  # ]
  # status = [  # list(object)
  #   {
  #     all_instances_config = [  # list(object)
  #       {
  #         current_revision = ""
  #         effective = false
  #       }
  #     ]
  #     is_stable = false
  #     stateful = [  # list(object)
  #       {
  #         has_stateful_config = false
  #         per_instance_configs = [  # list(object)
  #           {
  #             all_effective = false
  #           }
  #         ]
  #       }
  #     ]
  #     version_target = [  # list(object)
  #       {
  #         is_reached = false
  #       }
  #     ]
  #   }
  # ]
  # target_pools                   = []     # set(string) | computed | The full URL of all target pools to which new instances in t…
  # target_size                    = 0      # number | computed | The target number of running instances for this managed inst…
  # update_policy = [  # list(object)
  #   {
  #     max_surge_fixed = 0
  #     max_surge_percent = 0
  #     max_unavailable_fixed = 0
  #     max_unavailable_percent = 0
  #     minimal_action = ""
  #     most_disruptive_allowed_action = ""
  #     replacement_method = ""
  #     type = ""
  #   }
  # ]
  # version = [  # list(object)
  #   {
  #     instance_template = ""
  #     name = ""
  #     target_size = [  # list(object)
  #       {
  #         fixed = 0
  #         percent = 0
  #       }
  #     ]
  #   }
  # ]
  # wait_for_instances             = false  # bool | computed | Whether to wait for all instances to be created/updated befo…
  # wait_for_instances_status      = ""     # string | computed | When used with wait_for_instances specifies the status to wa…

}

