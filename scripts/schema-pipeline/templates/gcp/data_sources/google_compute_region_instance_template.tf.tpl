# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_region_instance_template                 │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_region_instance_template" "this" {

  filter                       = ""     # string | optional
  id                           = ""     # string | optional+computed
  most_recent                  = false  # bool | optional
  name                         = ""     # string | optional | The name of the instance template. If you leave this blank, …
  project                      = ""     # string | optional | The ID of the project in which the resource belongs. If it i…
  region                       = ""     # string | optional | The region in which the instance template is located. If it …

  # advanced_machine_features = [  # list(object)
  #   {
  #     enable_nested_virtualization = false
  #     threads_per_core = 0
  #     visible_core_count = 0
  #   }
  # ]
  # can_ip_forward               = false  # bool | computed | Whether to allow sending and receiving of packets with non-m…
  # confidential_instance_config = [  # list(object)
  #   {
  #     confidential_instance_type = ""
  #     enable_confidential_compute = false
  #   }
  # ]
  # description                  = ""     # string | computed | A brief description of this resource.
  # disk = [  # list(object)
  #   {
  #     auto_delete = false
  #     boot = false
  #     device_name = ""
  #     disk_encryption_key = [  # list(object)
  #       {
  #         kms_key_self_link = ""
  #       }
  #     ]
  #     disk_name = ""
  #     disk_size_gb = 0
  #     disk_type = ""
  #     interface = ""
  #     labels = {}  # map(string)
  #     mode = ""
  #     provisioned_iops = 0
  #     resource_manager_tags = {}  # map(string)
  #     resource_policies = []  # list(string)
  #     source = ""
  #     source_image = ""
  #     source_image_encryption_key = [  # list(object)
  #       {
  #         kms_key_self_link = ""
  #         kms_key_service_account = ""
  #       }
  #     ]
  #     source_snapshot = ""
  #     source_snapshot_encryption_key = [  # list(object)
  #       {
  #         kms_key_self_link = ""
  #         kms_key_service_account = ""
  #       }
  #     ]
  #     type = ""
  #   }
  # ]
  # effective_labels             = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # guest_accelerator = [  # list(object)
  #   {
  #     count = 0
  #     type = ""
  #   }
  # ]
  # instance_description         = ""     # string | computed | A description of the instance.
  # labels                       = {}     # map(string) | computed | A set of key/value label pairs to assign to instances create…
  # machine_type                 = ""     # string | computed | The machine type to create. To create a machine with a custo…
  # metadata                     = {}     # map(string) | computed | Metadata key/value pairs to make available from within insta…
  # metadata_fingerprint         = ""     # string | computed | The unique fingerprint of the metadata.
  # metadata_startup_script      = ""     # string | computed | An alternative to using the startup-script metadata key, mos…
  # min_cpu_platform             = ""     # string | computed | Specifies a minimum CPU platform. Applicable values are the …
  # name_prefix                  = ""     # string | computed | Creates a unique name beginning with the specified prefix. C…
  # network_interface = [  # list(object)
  #   {
  #     access_config = [  # list(object)
  #       {
  #         nat_ip = ""
  #         network_tier = ""
  #         public_ptr_domain_name = ""
  #       }
  #     ]
  #     alias_ip_range = [  # list(object)
  #       {
  #         ip_cidr_range = ""
  #         subnetwork_range_name = ""
  #       }
  #     ]
  #     internal_ipv6_prefix_length = 0
  #     ipv6_access_config = [  # list(object)
  #       {
  #         external_ipv6 = ""
  #         external_ipv6_prefix_length = ""
  #         name = ""
  #         network_tier = ""
  #         public_ptr_domain_name = ""
  #       }
  #     ]
  #     ipv6_access_type = ""
  #     ipv6_address = ""
  #     name = ""
  #     network = ""
  #     network_ip = ""
  #     nic_type = ""
  #     queue_count = 0
  #     stack_type = ""
  #     subnetwork = ""
  #     subnetwork_project = ""
  #   }
  # ]
  # network_performance_config = [  # list(object)
  #   {
  #     total_egress_bandwidth_tier = ""
  #   }
  # ]
  # reservation_affinity = [  # list(object)
  #   {
  #     specific_reservation = [  # list(object)
  #       {
  #         key = ""
  #         values = []  # list(string)
  #       }
  #     ]
  #     type = ""
  #   }
  # ]
  # resource_manager_tags        = {}     # map(string) | computed | A map of resource manager tags. 				Resource manager tag key…
  # resource_policies            = []     # list(string) | computed | A list of self_links of resource policies to attach to the i…
  # scheduling = [  # list(object)
  #   {
  #     automatic_restart = false
  #     instance_termination_action = ""
  #     local_ssd_recovery_timeout = [  # list(object)
  #       {
  #         nanos = 0
  #         seconds = 0
  #       }
  #     ]
  #     max_run_duration = [  # list(object)
  #       {
  #         nanos = 0
  #         seconds = 0
  #       }
  #     ]
  #     min_node_cpus = 0
  #     node_affinities = [  # set(object)
  #       {
  #         key = ""
  #         operator = ""
  #         values = []  # set(string)
  #       }
  #     ]
  #     on_host_maintenance = ""
  #     on_instance_stop_action = [  # list(object)
  #       {
  #         discard_local_ssd = false
  #       }
  #     ]
  #     preemptible = false
  #     provisioning_model = ""
  #   }
  # ]
  # self_link                    = ""     # string | computed | The URI of the created resource.
  # service_account = [  # list(object)
  #   {
  #     email = ""
  #     scopes = []  # set(string)
  #   }
  # ]
  # shielded_instance_config = [  # list(object)
  #   {
  #     enable_integrity_monitoring = false
  #     enable_secure_boot = false
  #     enable_vtpm = false
  #   }
  # ]
  # tags                         = []     # set(string) | computed | Tags to attach to the instance.
  # tags_fingerprint             = ""     # string | computed | The unique fingerprint of the tags.
  # terraform_labels             = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

