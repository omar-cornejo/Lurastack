# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_cluster                                │
# └──────────────────────────────────────────────────────────────┘
data "google_container_cluster" "this" {

  name                                     = ""     # string | required | The name of the cluster, unique within the project and locat…
  id                                       = ""     # string | optional+computed
  location                                 = ""     # string | optional | The location (region or zone) in which the cluster master wi…
  project                                  = ""     # string | optional | The ID of the project in which the resource belongs. If it i…

  # addons_config = [  # list(object)
  #   {
  #     cloudrun_config = [  # list(object)
  #       {
  #         disabled = false
  #         load_balancer_type = ""
  #       }
  #     ]
  #     config_connector_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     dns_cache_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     gce_persistent_disk_csi_driver_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     gcp_filestore_csi_driver_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     gcs_fuse_csi_driver_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     gke_backup_agent_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     horizontal_pod_autoscaling = [  # list(object)
  #       {
  #         disabled = false
  #       }
  #     ]
  #     http_load_balancing = [  # list(object)
  #       {
  #         disabled = false
  #       }
  #     ]
  #     network_policy_config = [  # list(object)
  #       {
  #         disabled = false
  #       }
  #     ]
  #     ray_operator_config = [  # list(object)
  #       {
  #         enabled = false
  #         ray_cluster_logging_config = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #         ray_cluster_monitoring_config = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #       }
  #     ]
  #     stateful_ha_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #   }
  # ]
  # allow_net_admin                          = false  # bool | computed | Enable NET_ADMIN for this cluster.
  # authenticator_groups_config = [  # list(object)
  #   {
  #     security_group = ""
  #   }
  # ]
  # binary_authorization = [  # list(object)
  #   {
  #     enabled = false
  #     evaluation_mode = ""
  #   }
  # ]
  # cluster_autoscaling = [  # list(object)
  #   {
  #     auto_provisioning_defaults = [  # list(object)
  #       {
  #         boot_disk_kms_key = ""
  #         disk_size = 0
  #         disk_type = ""
  #         image_type = ""
  #         management = [  # list(object)
  #           {
  #             auto_repair = false
  #             auto_upgrade = false
  #             upgrade_options = [  # list(object)
  #               {
  #                 auto_upgrade_start_time = ""
  #                 description = ""
  #               }
  #             ]
  #           }
  #         ]
  #         min_cpu_platform = ""
  #         oauth_scopes = []  # list(string)
  #         service_account = ""
  #         shielded_instance_config = [  # list(object)
  #           {
  #             enable_integrity_monitoring = false
  #             enable_secure_boot = false
  #           }
  #         ]
  #         upgrade_settings = [  # list(object)
  #           {
  #             blue_green_settings = [  # list(object)
  #               {
  #                 node_pool_soak_duration = ""
  #                 standard_rollout_policy = [  # list(object)
  #                   {
  #                     batch_node_count = 0
  #                     batch_percentage = 0
  #                     batch_soak_duration = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             max_surge = 0
  #             max_unavailable = 0
  #             strategy = ""
  #           }
  #         ]
  #       }
  #     ]
  #     auto_provisioning_locations = []  # list(string)
  #     autoscaling_profile = ""
  #     enabled = false
  #     resource_limits = [  # list(object)
  #       {
  #         maximum = 0
  #         minimum = 0
  #         resource_type = ""
  #       }
  #     ]
  #   }
  # ]
  # cluster_ipv4_cidr                        = ""     # string | computed | The IP address range of the Kubernetes pods in this cluster …
  # confidential_nodes = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # cost_management_config = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # database_encryption = [  # list(object)
  #   {
  #     key_name = ""
  #     state = ""
  #   }
  # ]
  # datapath_provider                        = ""     # string | computed | The desired datapath provider for this cluster. By default, …
  # default_max_pods_per_node                = 0      # number | computed | The default maximum number of pods per node in this cluster.…
  # default_snat_status = [  # list(object)
  #   {
  #     disabled = false
  #   }
  # ]
  # deletion_protection                      = false  # bool | computed | When the field is set to true or unset in Terraform state, a…
  # description                              = ""     # string | computed |  Description of the cluster.
  # dns_config = [  # list(object)
  #   {
  #     cluster_dns = ""
  #     cluster_dns_domain = ""
  #     cluster_dns_scope = ""
  #   }
  # ]
  # enable_autopilot                         = false  # bool | computed | Enable Autopilot for this cluster.
  # enable_cilium_clusterwide_network_policy = false  # bool | computed | Whether Cilium cluster-wide network policy is enabled on thi…
  # enable_intranode_visibility              = false  # bool | computed | Whether Intra-node visibility is enabled for this cluster. T…
  # enable_k8s_beta_apis = [  # list(object)
  #   {
  #     enabled_apis = []  # set(string)
  #   }
  # ]
  # enable_kubernetes_alpha                  = false  # bool | computed | Whether to enable Kubernetes Alpha features for this cluster…
  # enable_l4_ilb_subsetting                 = false  # bool | computed | Whether L4ILB Subsetting is enabled for this cluster.
  # enable_legacy_abac                       = false  # bool | computed | Whether the ABAC authorizer is enabled for this cluster. Whe…
  # enable_multi_networking                  = false  # bool | computed | Whether multi-networking is enabled for this cluster.
  # enable_shielded_nodes                    = false  # bool | computed | Enable Shielded Nodes features on all nodes in this cluster.…
  # enable_tpu                               = false  # bool | computed | Whether to enable Cloud TPU resources in this cluster.
  # endpoint                                 = ""     # string | computed | The IP address of this cluster's Kubernetes master.
  # fleet = [  # list(object)
  #   {
  #     membership = ""
  #     membership_id = ""
  #     membership_location = ""
  #     pre_registered = false
  #     project = ""
  #   }
  # ]
  # gateway_api_config = [  # list(object)
  #   {
  #     channel = ""
  #   }
  # ]
  # identity_service_config = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # initial_node_count                       = 0      # number | computed | The number of nodes to create in this cluster's default node…
  # ip_allocation_policy = [  # list(object)
  #   {
  #     additional_pod_ranges_config = [  # list(object)
  #       {
  #         pod_range_names = []  # set(string)
  #       }
  #     ]
  #     cluster_ipv4_cidr_block = ""
  #     cluster_secondary_range_name = ""
  #     pod_cidr_overprovision_config = [  # list(object)
  #       {
  #         disabled = false
  #       }
  #     ]
  #     services_ipv4_cidr_block = ""
  #     services_secondary_range_name = ""
  #     stack_type = ""
  #   }
  # ]
  # label_fingerprint                        = ""     # string | computed | The fingerprint of the set of labels for this cluster.
  # logging_config = [  # list(object)
  #   {
  #     enable_components = []  # list(string)
  #   }
  # ]
  # logging_service                          = ""     # string | computed | The logging service that the cluster should write logs to. A…
  # maintenance_policy = [  # list(object)
  #   {
  #     daily_maintenance_window = [  # list(object)
  #       {
  #         duration = ""
  #         start_time = ""
  #       }
  #     ]
  #     maintenance_exclusion = [  # set(object)
  #       {
  #         end_time = ""
  #         exclusion_name = ""
  #         exclusion_options = [  # list(object)
  #           {
  #             scope = ""
  #           }
  #         ]
  #         start_time = ""
  #       }
  #     ]
  #     recurring_window = [  # list(object)
  #       {
  #         end_time = ""
  #         recurrence = ""
  #         start_time = ""
  #       }
  #     ]
  #   }
  # ]
  # master_auth = [  # list(object)
  #   {
  #     client_certificate = ""
  #     client_certificate_config = [  # list(object)
  #       {
  #         issue_client_certificate = false
  #       }
  #     ]
  #     client_key = ""
  #     cluster_ca_certificate = ""
  #   }
  # ]
  # master_authorized_networks_config = [  # list(object)
  #   {
  #     cidr_blocks = [  # set(object)
  #       {
  #         cidr_block = ""
  #         display_name = ""
  #       }
  #     ]
  #     gcp_public_cidrs_access_enabled = false
  #   }
  # ]
  # master_version                           = ""     # string | computed | The current version of the master in the cluster. This may b…
  # mesh_certificates = [  # list(object)
  #   {
  #     enable_certificates = false
  #   }
  # ]
  # min_master_version                       = ""     # string | computed | The minimum version of the master. GKE will auto-update the …
  # monitoring_config = [  # list(object)
  #   {
  #     advanced_datapath_observability_config = [  # list(object)
  #       {
  #         enable_metrics = false
  #         enable_relay = false
  #         relay_mode = ""
  #       }
  #     ]
  #     enable_components = []  # list(string)
  #     managed_prometheus = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #   }
  # ]
  # monitoring_service                       = ""     # string | computed | The monitoring service that the cluster should write metrics…
  # network                                  = ""     # string | computed | The name or self_link of the Google Compute Engine network t…
  # network_policy = [  # list(object)
  #   {
  #     enabled = false
  #     provider = ""
  #   }
  # ]
  # networking_mode                          = ""     # string | computed | Determines whether alias IPs or routes will be used for pod …
  # node_config = [  # list(object)
  #   {
  #     advanced_machine_features = [  # list(object)
  #       {
  #         enable_nested_virtualization = false
  #         threads_per_core = 0
  #       }
  #     ]
  #     boot_disk_kms_key = ""
  #     confidential_nodes = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     containerd_config = [  # list(object)
  #       {
  #         private_registry_access_config = [  # list(object)
  #           {
  #             certificate_authority_domain_config = [  # list(object)
  #               {
  #                 fqdns = []  # list(string)
  #                 gcp_secret_manager_certificate_config = [  # list(object)
  #                   {
  #                     secret_uri = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             enabled = false
  #           }
  #         ]
  #       }
  #     ]
  #     disk_size_gb = 0
  #     disk_type = ""
  #     effective_taints = [  # list(object)
  #       {
  #         effect = ""
  #         key = ""
  #         value = ""
  #       }
  #     ]
  #     enable_confidential_storage = false
  #     ephemeral_storage_local_ssd_config = [  # list(object)
  #       {
  #         local_ssd_count = 0
  #       }
  #     ]
  #     fast_socket = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     gcfs_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     guest_accelerator = [  # list(object)
  #       {
  #         count = 0
  #         gpu_driver_installation_config = [  # list(object)
  #           {
  #             gpu_driver_version = ""
  #           }
  #         ]
  #         gpu_partition_size = ""
  #         gpu_sharing_config = [  # list(object)
  #           {
  #             gpu_sharing_strategy = ""
  #             max_shared_clients_per_gpu = 0
  #           }
  #         ]
  #         type = ""
  #       }
  #     ]
  #     gvnic = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     host_maintenance_policy = [  # list(object)
  #       {
  #         maintenance_interval = ""
  #       }
  #     ]
  #     image_type = ""
  #     kubelet_config = [  # list(object)
  #       {
  #         cpu_cfs_quota = false
  #         cpu_cfs_quota_period = ""
  #         cpu_manager_policy = ""
  #         insecure_kubelet_readonly_port_enabled = ""
  #         pod_pids_limit = 0
  #       }
  #     ]
  #     labels = {}  # map(string)
  #     linux_node_config = [  # list(object)
  #       {
  #         cgroup_mode = ""
  #         sysctls = {}  # map(string)
  #       }
  #     ]
  #     local_nvme_ssd_block_config = [  # list(object)
  #       {
  #         local_ssd_count = 0
  #       }
  #     ]
  #     local_ssd_count = 0
  #     logging_variant = ""
  #     machine_type = ""
  #     metadata = {}  # map(string)
  #     min_cpu_platform = ""
  #     node_group = ""
  #     oauth_scopes = []  # set(string)
  #     preemptible = false
  #     reservation_affinity = [  # list(object)
  #       {
  #         consume_reservation_type = ""
  #         key = ""
  #         values = []  # set(string)
  #       }
  #     ]
  #     resource_labels = {}  # map(string)
  #     resource_manager_tags = {}  # map(string)
  #     secondary_boot_disks = [  # list(object)
  #       {
  #         disk_image = ""
  #         mode = ""
  #       }
  #     ]
  #     service_account = ""
  #     shielded_instance_config = [  # list(object)
  #       {
  #         enable_integrity_monitoring = false
  #         enable_secure_boot = false
  #       }
  #     ]
  #     sole_tenant_config = [  # list(object)
  #       {
  #         node_affinity = [  # set(object)
  #           {
  #             key = ""
  #             operator = ""
  #             values = []  # list(string)
  #           }
  #         ]
  #       }
  #     ]
  #     spot = false
  #     tags = []  # list(string)
  #     taint = [  # list(object)
  #       {
  #         effect = ""
  #         key = ""
  #         value = ""
  #       }
  #     ]
  #     workload_metadata_config = [  # list(object)
  #       {
  #         mode = ""
  #       }
  #     ]
  #   }
  # ]
  # node_locations                           = []     # set(string) | computed | The list of zones in which the cluster's nodes are located. …
  # node_pool = [  # list(object)
  #   {
  #     autoscaling = [  # list(object)
  #       {
  #         location_policy = ""
  #         max_node_count = 0
  #         min_node_count = 0
  #         total_max_node_count = 0
  #         total_min_node_count = 0
  #       }
  #     ]
  #     initial_node_count = 0
  #     instance_group_urls = []  # list(string)
  #     managed_instance_group_urls = []  # list(string)
  #     management = [  # list(object)
  #       {
  #         auto_repair = false
  #         auto_upgrade = false
  #       }
  #     ]
  #     max_pods_per_node = 0
  #     name = ""
  #     name_prefix = ""
  #     network_config = [  # list(object)
  #       {
  #         additional_node_network_configs = [  # list(object)
  #           {
  #             network = ""
  #             subnetwork = ""
  #           }
  #         ]
  #         additional_pod_network_configs = [  # list(object)
  #           {
  #             max_pods_per_node = 0
  #             secondary_pod_range = ""
  #             subnetwork = ""
  #           }
  #         ]
  #         create_pod_range = false
  #         enable_private_nodes = false
  #         network_performance_config = [  # list(object)
  #           {
  #             total_egress_bandwidth_tier = ""
  #           }
  #         ]
  #         pod_cidr_overprovision_config = [  # list(object)
  #           {
  #             disabled = false
  #           }
  #         ]
  #         pod_ipv4_cidr_block = ""
  #         pod_range = ""
  #       }
  #     ]
  #     node_config = [  # list(object)
  #       {
  #         advanced_machine_features = [  # list(object)
  #           {
  #             enable_nested_virtualization = false
  #             threads_per_core = 0
  #           }
  #         ]
  #         boot_disk_kms_key = ""
  #         confidential_nodes = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #         containerd_config = [  # list(object)
  #           {
  #             private_registry_access_config = [  # list(object)
  #               {
  #                 certificate_authority_domain_config = [  # list(object)
  #                   {
  #                     fqdns = []  # list(string)
  #                     gcp_secret_manager_certificate_config = [  # list(object)
  #                       {
  #                         secret_uri = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 enabled = false
  #               }
  #             ]
  #           }
  #         ]
  #         disk_size_gb = 0
  #         disk_type = ""
  #         effective_taints = [  # list(object)
  #           {
  #             effect = ""
  #             key = ""
  #             value = ""
  #           }
  #         ]
  #         enable_confidential_storage = false
  #         ephemeral_storage_local_ssd_config = [  # list(object)
  #           {
  #             local_ssd_count = 0
  #           }
  #         ]
  #         fast_socket = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #         gcfs_config = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #         guest_accelerator = [  # list(object)
  #           {
  #             count = 0
  #             gpu_driver_installation_config = [  # list(object)
  #               {
  #                 gpu_driver_version = ""
  #               }
  #             ]
  #             gpu_partition_size = ""
  #             gpu_sharing_config = [  # list(object)
  #               {
  #                 gpu_sharing_strategy = ""
  #                 max_shared_clients_per_gpu = 0
  #               }
  #             ]
  #             type = ""
  #           }
  #         ]
  #         gvnic = [  # list(object)
  #           {
  #             enabled = false
  #           }
  #         ]
  #         host_maintenance_policy = [  # list(object)
  #           {
  #             maintenance_interval = ""
  #           }
  #         ]
  #         image_type = ""
  #         kubelet_config = [  # list(object)
  #           {
  #             cpu_cfs_quota = false
  #             cpu_cfs_quota_period = ""
  #             cpu_manager_policy = ""
  #             insecure_kubelet_readonly_port_enabled = ""
  #             pod_pids_limit = 0
  #           }
  #         ]
  #         labels = {}  # map(string)
  #         linux_node_config = [  # list(object)
  #           {
  #             cgroup_mode = ""
  #             sysctls = {}  # map(string)
  #           }
  #         ]
  #         local_nvme_ssd_block_config = [  # list(object)
  #           {
  #             local_ssd_count = 0
  #           }
  #         ]
  #         local_ssd_count = 0
  #         logging_variant = ""
  #         machine_type = ""
  #         metadata = {}  # map(string)
  #         min_cpu_platform = ""
  #         node_group = ""
  #         oauth_scopes = []  # set(string)
  #         preemptible = false
  #         reservation_affinity = [  # list(object)
  #           {
  #             consume_reservation_type = ""
  #             key = ""
  #             values = []  # set(string)
  #           }
  #         ]
  #         resource_labels = {}  # map(string)
  #         resource_manager_tags = {}  # map(string)
  #         secondary_boot_disks = [  # list(object)
  #           {
  #             disk_image = ""
  #             mode = ""
  #           }
  #         ]
  #         service_account = ""
  #         shielded_instance_config = [  # list(object)
  #           {
  #             enable_integrity_monitoring = false
  #             enable_secure_boot = false
  #           }
  #         ]
  #         sole_tenant_config = [  # list(object)
  #           {
  #             node_affinity = [  # set(object)
  #               {
  #                 key = ""
  #                 operator = ""
  #                 values = []  # list(string)
  #               }
  #             ]
  #           }
  #         ]
  #         spot = false
  #         tags = []  # list(string)
  #         taint = [  # list(object)
  #           {
  #             effect = ""
  #             key = ""
  #             value = ""
  #           }
  #         ]
  #         workload_metadata_config = [  # list(object)
  #           {
  #             mode = ""
  #           }
  #         ]
  #       }
  #     ]
  #     node_count = 0
  #     node_locations = []  # set(string)
  #     placement_policy = [  # list(object)
  #       {
  #         policy_name = ""
  #         tpu_topology = ""
  #         type = ""
  #       }
  #     ]
  #     queued_provisioning = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     upgrade_settings = [  # list(object)
  #       {
  #         blue_green_settings = [  # list(object)
  #           {
  #             node_pool_soak_duration = ""
  #             standard_rollout_policy = [  # list(object)
  #               {
  #                 batch_node_count = 0
  #                 batch_percentage = 0
  #                 batch_soak_duration = ""
  #               }
  #             ]
  #           }
  #         ]
  #         max_surge = 0
  #         max_unavailable = 0
  #         strategy = ""
  #       }
  #     ]
  #     version = ""
  #   }
  # ]
  # node_pool_auto_config = [  # list(object)
  #   {
  #     network_tags = [  # list(object)
  #       {
  #         tags = []  # list(string)
  #       }
  #     ]
  #     node_kubelet_config = [  # list(object)
  #       {
  #         insecure_kubelet_readonly_port_enabled = ""
  #       }
  #     ]
  #     resource_manager_tags = {}  # map(string)
  #   }
  # ]
  # node_pool_defaults = [  # list(object)
  #   {
  #     node_config_defaults = [  # list(object)
  #       {
  #         containerd_config = [  # list(object)
  #           {
  #             private_registry_access_config = [  # list(object)
  #               {
  #                 certificate_authority_domain_config = [  # list(object)
  #                   {
  #                     fqdns = []  # list(string)
  #                     gcp_secret_manager_certificate_config = [  # list(object)
  #                       {
  #                         secret_uri = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 enabled = false
  #               }
  #             ]
  #           }
  #         ]
  #         insecure_kubelet_readonly_port_enabled = ""
  #         logging_variant = ""
  #       }
  #     ]
  #   }
  # ]
  # node_version                             = ""     # string | computed | The Kubernetes version on the nodes. Must either be unset or…
  # notification_config = [  # list(object)
  #   {
  #     pubsub = [  # list(object)
  #       {
  #         enabled = false
  #         filter = [  # list(object)
  #           {
  #             event_type = []  # list(string)
  #           }
  #         ]
  #         topic = ""
  #       }
  #     ]
  #   }
  # ]
  # operation                                = ""     # string | computed
  # private_cluster_config = [  # list(object)
  #   {
  #     enable_private_endpoint = false
  #     enable_private_nodes = false
  #     master_global_access_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     master_ipv4_cidr_block = ""
  #     peering_name = ""
  #     private_endpoint = ""
  #     private_endpoint_subnetwork = ""
  #     public_endpoint = ""
  #   }
  # ]
  # private_ipv6_google_access               = ""     # string | computed | The desired state of IPv6 connectivity to Google Services. B…
  # release_channel = [  # list(object)
  #   {
  #     channel = ""
  #   }
  # ]
  # remove_default_node_pool                 = false  # bool | computed | If true, deletes the default node pool upon cluster creation…
  # resource_labels                          = {}     # map(string) | computed | The GCE resource labels (a map of key/value pairs) to be app…
  # resource_usage_export_config = [  # list(object)
  #   {
  #     bigquery_destination = [  # list(object)
  #       {
  #         dataset_id = ""
  #       }
  #     ]
  #     enable_network_egress_metering = false
  #     enable_resource_consumption_metering = false
  #   }
  # ]
  # security_posture_config = [  # list(object)
  #   {
  #     mode = ""
  #     vulnerability_mode = ""
  #   }
  # ]
  # self_link                                = ""     # string | computed | Server-defined URL for the resource.
  # service_external_ips_config = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # services_ipv4_cidr                       = ""     # string | computed | The IP address range of the Kubernetes services in this clus…
  # subnetwork                               = ""     # string | computed | The name or self_link of the Google Compute Engine subnetwor…
  # tpu_ipv4_cidr_block                      = ""     # string | computed | The IP address range of the Cloud TPUs in this cluster, in C…
  # vertical_pod_autoscaling = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # workload_identity_config = [  # list(object)
  #   {
  #     workload_pool = ""
  #   }
  # ]

}

