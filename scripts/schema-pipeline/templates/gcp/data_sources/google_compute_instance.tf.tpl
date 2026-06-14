# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_instance                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_instance" "this" {

  id                           = ""     # string | optional+computed
  name                         = ""     # string | optional | The name of the instance. One of name or self_link must be p…
  project                      = ""     # string | optional | The ID of the project in which the resource belongs. If self…
  self_link                    = ""     # string | optional | The URI of the created resource.
  zone                         = ""     # string | optional | The zone of the instance. If self_link is provided, this val…

  # advanced_machine_features = [  # list(object)
  #   {
  #     enable_nested_virtualization = false
  #     threads_per_core = 0
  #     visible_core_count = 0
  #   }
  # ]
  # allow_stopping_for_update    = false  # bool | computed | If true, allows Terraform to stop the instance to update its…
  # attached_disk = [  # list(object)
  #   {
  #     device_name = ""
  #     disk_encryption_key_raw = ""
  #     disk_encryption_key_sha256 = ""
  #     kms_key_self_link = ""
  #     mode = ""
  #     source = ""
  #   }
  # ]
  # boot_disk = [  # list(object)
  #   {
  #     auto_delete = false
  #     device_name = ""
  #     disk_encryption_key_raw = ""
  #     disk_encryption_key_sha256 = ""
  #     initialize_params = [  # list(object)
  #       {
  #         enable_confidential_compute = false
  #         image = ""
  #         labels = {}  # map(string)
  #         provisioned_iops = 0
  #         provisioned_throughput = 0
  #         resource_manager_tags = {}  # map(string)
  #         size = 0
  #         storage_pool = ""
  #         type = ""
  #       }
  #     ]
  #     kms_key_self_link = ""
  #     mode = ""
  #     source = ""
  #   }
  # ]
  # can_ip_forward               = false  # bool | computed | Whether sending and receiving of packets with non-matching s…
  # confidential_instance_config = [  # list(object)
  #   {
  #     confidential_instance_type = ""
  #     enable_confidential_compute = false
  #   }
  # ]
  # cpu_platform                 = ""     # string | computed | The CPU platform used by this instance.
  # current_status               = ""     # string | computed |  					Current status of the instance. 					This could be one…
  # deletion_protection          = false  # bool | computed | Whether deletion protection is enabled on this instance.
  # description                  = ""     # string | computed | A brief description of the resource.
  # desired_status               = ""     # string | computed | Desired status of the instance. Either "RUNNING" or "TERMINA…
  # effective_labels             = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # enable_display               = false  # bool | computed | Whether the instance has virtual displays enabled.
  # guest_accelerator = [  # list(object)
  #   {
  #     count = 0
  #     type = ""
  #   }
  # ]
  # hostname                     = ""     # string | computed | A custom hostname for the instance. Must be a fully qualifie…
  # instance_id                  = ""     # string | computed | The server-assigned unique identifier of this instance.
  # label_fingerprint            = ""     # string | computed | The unique fingerprint of the labels.
  # labels                       = {}     # map(string) | computed | A set of key/value label pairs assigned to the instance.  		…
  # machine_type                 = ""     # string | computed | The machine type to create.
  # metadata                     = {}     # map(string) | computed | Metadata key/value pairs made available within the instance.
  # metadata_fingerprint         = ""     # string | computed | The unique fingerprint of the metadata.
  # metadata_startup_script      = ""     # string | computed | Metadata startup scripts made available within the instance.
  # min_cpu_platform             = ""     # string | computed | The minimum CPU platform specified for the VM instance.
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
  # params = [  # list(object)
  #   {
  #     resource_manager_tags = {}  # map(string)
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
  # scratch_disk = [  # list(object)
  #   {
  #     device_name = ""
  #     interface = ""
  #     size = 0
  #   }
  # ]
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
  # tags                         = []     # set(string) | computed | The list of tags attached to the instance.
  # tags_fingerprint             = ""     # string | computed | The unique fingerprint of the tags.
  # terraform_labels             = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

