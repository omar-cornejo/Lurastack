# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_group_manager               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_group_manager" "this" {

  base_instance_name             = ""     # string | required | The base instance name to use for instances in this group. T…
  name                           = ""     # string | required | The name of the instance group manager. Must be 1-63 charact…
  description                    = ""     # string | optional | An optional textual description of the instance group manage…
  id                             = ""     # string | optional+computed
  list_managed_instances_results = ""     # string | optional | Pagination behavior of the listManagedInstances API method f…
  project                        = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  target_pools                   = []     # set(string) | optional | The full URL of all target pools to which new instances in t…
  target_size                    = 0      # number | optional+computed | The target number of running instances for this managed inst…
  wait_for_instances             = false  # bool | optional | Whether to wait for all instances to be created/updated befo…
  wait_for_instances_status      = ""     # string | optional | When used with wait_for_instances specifies the status to wa…
  zone                           = ""     # string | optional+computed | The zone that instances in this group should be created in.

  # creation_timestamp             = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # fingerprint                    = ""     # string | computed | The fingerprint of the instance group manager.
  # instance_group                 = ""     # string | computed | The full URL of the instance group created by the manager.
  # operation                      = ""     # string | computed
  # self_link                      = ""     # string | computed | The URL of the created resource.
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

  all_instances_config { # list [0..1]
    labels   = {}     # map(string) | optional | The label key-value pairs that you want to patch onto the in…
    metadata = {}     # map(string) | optional | The metadata key-value pairs that you want to patch onto the…

  }

  auto_healing_policies { # list [0..1]
    health_check      = ""     # string | required | The health check resource that signals autohealing.
    initial_delay_sec = 0      # number | required | The number of seconds that the managed instance group waits …

  }

  instance_lifecycle_policy { # list [0..1]
    default_action_on_failure = ""     # string | optional | Default behavior for all instance or health check failures.
    force_update_on_repair    = ""     # string | optional | Specifies whether to apply the group's latest configuration …

  }

  named_port { # set
    name = ""     # string | required | The name of the port.
    port = 0      # number | required | The port number.

  }

  stateful_disk { # set
    device_name = ""     # string | required | The device name of the disk to be attached.
    delete_rule = ""     # string | optional | A value that prescribes what should happen to the stateful d…

  }

  stateful_external_ip { # list
    delete_rule    = ""     # string | optional | A value that prescribes what should happen to an associated …
    interface_name = ""     # string | optional | The network interface name

  }

  stateful_internal_ip { # list
    delete_rule    = ""     # string | optional | A value that prescribes what should happen to an associated …
    interface_name = ""     # string | optional | The network interface name

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  update_policy { # list [0..1]
    minimal_action                 = ""     # string | required | Minimal action to be taken on an instance. You can specify e…
    type                           = ""     # string | required | The type of update process. You can specify either PROACTIVE…
    max_surge_fixed                = 0      # number | optional+computed | Specifies a fixed number of VM instances. This must be a pos…
    max_surge_percent              = 0      # number | optional | Specifies a percentage of instances between 0 to 100%, inclu…
    max_unavailable_fixed          = 0      # number | optional+computed | Specifies a fixed number of VM instances. This must be a pos…
    max_unavailable_percent        = 0      # number | optional | Specifies a percentage of instances between 0 to 100%, inclu…
    most_disruptive_allowed_action = ""     # string | optional | Most disruptive action that is allowed to be taken on an ins…
    replacement_method             = ""     # string | optional | The instance replacement method for managed instance groups.…

  }

  version { # list [1..*]
    instance_template = ""     # string | required | The full URL to an instance template from which all new inst…
    name              = ""     # string | optional | Version name.

    target_size { # list [0..1]
      fixed   = 0      # number | optional | The number of instances which are managed for this version. …
      percent = 0      # number | optional | The number of instances (calculated as percentage) which are…

    }

  }

}

