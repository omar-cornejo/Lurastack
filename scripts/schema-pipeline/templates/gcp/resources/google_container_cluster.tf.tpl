# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_cluster                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_cluster" "this" {

  name                                     = ""     # string | required | The name of the cluster, unique within the project and locat…
  allow_net_admin                          = false  # bool | optional | Enable NET_ADMIN for this cluster.
  cluster_ipv4_cidr                        = ""     # string | optional+computed | The IP address range of the Kubernetes pods in this cluster …
  datapath_provider                        = ""     # string | optional+computed | The desired datapath provider for this cluster. By default, …
  default_max_pods_per_node                = 0      # number | optional+computed | The default maximum number of pods per node in this cluster.…
  deletion_protection                      = false  # bool | optional | When the field is set to true or unset in Terraform state, a…
  description                              = ""     # string | optional |  Description of the cluster.
  enable_autopilot                         = false  # bool | optional | Enable Autopilot for this cluster.
  enable_cilium_clusterwide_network_policy = false  # bool | optional | Whether Cilium cluster-wide network policy is enabled on thi…
  enable_intranode_visibility              = false  # bool | optional+computed | Whether Intra-node visibility is enabled for this cluster. T…
  enable_kubernetes_alpha                  = false  # bool | optional | Whether to enable Kubernetes Alpha features for this cluster…
  enable_l4_ilb_subsetting                 = false  # bool | optional | Whether L4ILB Subsetting is enabled for this cluster.
  enable_legacy_abac                       = false  # bool | optional | Whether the ABAC authorizer is enabled for this cluster. Whe…
  enable_multi_networking                  = false  # bool | optional | Whether multi-networking is enabled for this cluster.
  enable_shielded_nodes                    = false  # bool | optional | Enable Shielded Nodes features on all nodes in this cluster.…
  enable_tpu                               = false  # bool | optional | Whether to enable Cloud TPU resources in this cluster.
  id                                       = ""     # string | optional+computed
  initial_node_count                       = 0      # number | optional | The number of nodes to create in this cluster's default node…
  location                                 = ""     # string | optional+computed | The location (region or zone) in which the cluster master wi…
  logging_service                          = ""     # string | optional+computed | The logging service that the cluster should write logs to. A…
  min_master_version                       = ""     # string | optional | The minimum version of the master. GKE will auto-update the …
  monitoring_service                       = ""     # string | optional+computed | The monitoring service that the cluster should write metrics…
  network                                  = ""     # string | optional | The name or self_link of the Google Compute Engine network t…
  networking_mode                          = ""     # string | optional+computed | Determines whether alias IPs or routes will be used for pod …
  node_locations                           = []     # set(string) | optional+computed | The list of zones in which the cluster's nodes are located. …
  node_version                             = ""     # string | optional+computed | The Kubernetes version on the nodes. Must either be unset or…
  private_ipv6_google_access               = ""     # string | optional+computed | The desired state of IPv6 connectivity to Google Services. B…
  project                                  = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  remove_default_node_pool                 = false  # bool | optional | If true, deletes the default node pool upon cluster creation…
  resource_labels                          = {}     # map(string) | optional | The GCE resource labels (a map of key/value pairs) to be app…
  subnetwork                               = ""     # string | optional+computed | The name or self_link of the Google Compute Engine subnetwor…

  # endpoint                                 = ""     # string | computed | The IP address of this cluster's Kubernetes master.
  # label_fingerprint                        = ""     # string | computed | The fingerprint of the set of labels for this cluster.
  # master_version                           = ""     # string | computed | The current version of the master in the cluster. This may b…
  # operation                                = ""     # string | computed
  # self_link                                = ""     # string | computed | Server-defined URL for the resource.
  # services_ipv4_cidr                       = ""     # string | computed | The IP address range of the Kubernetes services in this clus…
  # tpu_ipv4_cidr_block                      = ""     # string | computed | The IP address range of the Cloud TPUs in this cluster, in C…

  addons_config { # list [0..1]

    cloudrun_config { # list [0..1]
      disabled           = false  # bool | required
      load_balancer_type = ""     # string | optional

    }

    config_connector_config { # list [0..1]
      enabled = false  # bool | required

    }

    dns_cache_config { # list [0..1]
      enabled = false  # bool | required

    }

    gce_persistent_disk_csi_driver_config { # list [0..1]
      enabled = false  # bool | required

    }

    gcp_filestore_csi_driver_config { # list [0..1]
      enabled = false  # bool | required

    }

    gcs_fuse_csi_driver_config { # list [0..1]
      enabled = false  # bool | required

    }

    gke_backup_agent_config { # list [0..1]
      enabled = false  # bool | required

    }

    horizontal_pod_autoscaling { # list [0..1]
      disabled = false  # bool | required

    }

    http_load_balancing { # list [0..1]
      disabled = false  # bool | required

    }

    network_policy_config { # list [0..1]
      disabled = false  # bool | required

    }

    ray_operator_config { # list [0..3]
      enabled = false  # bool | required

      ray_cluster_logging_config { # list [0..1]
        enabled = false  # bool | required

      }

      ray_cluster_monitoring_config { # list [0..1]
        enabled = false  # bool | required

      }

    }

    stateful_ha_config { # list [0..1]
      enabled = false  # bool | required

    }

  }

  authenticator_groups_config { # list [0..1]
    security_group = ""     # string | required | The name of the RBAC security group for use with Google secu…

  }

  binary_authorization { # list [0..1]
    enabled         = false  # bool | optional+DEPRECATED | Enable Binary Authorization for this cluster.
    evaluation_mode = ""     # string | optional+computed | Mode of operation for Binary Authorization policy evaluation…

  }

  cluster_autoscaling { # list [0..1]
    auto_provisioning_locations = []     # list(string) | optional+computed | The list of Google Compute Engine zones in which the NodePoo…
    autoscaling_profile         = ""     # string | optional | Configuration options for the Autoscaling profile feature, w…
    enabled                     = false  # bool | optional+computed | Whether node auto-provisioning is enabled. Resource limits f…

    auto_provisioning_defaults { # list [0..1]
      boot_disk_kms_key = ""     # string | optional | The Customer Managed Encryption Key used to encrypt the boot…
      disk_size         = 0      # number | optional | Size of the disk attached to each node, specified in GB. The…
      disk_type         = ""     # string | optional | Type of the disk attached to each node.
      image_type        = ""     # string | optional | The default image type used by NAP once a new node pool is b…
      min_cpu_platform  = ""     # string | optional | Minimum CPU platform to be used by this instance. The instan…
      oauth_scopes      = []     # list(string) | optional+computed | Scopes that are used by NAP when creating node pools.
      service_account   = ""     # string | optional | The Google Cloud Platform Service Account to be used by the …

      management { # list [0..1]
        auto_repair     = false  # bool | optional+computed | Specifies whether the node auto-repair is enabled for the no…
        auto_upgrade    = false  # bool | optional+computed | Specifies whether node auto-upgrade is enabled for the node …

        # upgrade_options = [  # list(object)
        #   {
        #     auto_upgrade_start_time = ""
        #     description = ""
        #   }
        # ]

      }

      shielded_instance_config { # list [0..1]
        enable_integrity_monitoring = false  # bool | optional | Defines whether the instance has integrity monitoring enable…
        enable_secure_boot          = false  # bool | optional | Defines whether the instance has Secure Boot enabled.

      }

      upgrade_settings { # list [0..1]
        max_surge       = 0      # number | optional | The maximum number of nodes that can be created beyond the c…
        max_unavailable = 0      # number | optional | The maximum number of nodes that can be simultaneously unava…
        strategy        = ""     # string | optional+computed | Update strategy of the node pool.

        blue_green_settings { # list [0..1]
          node_pool_soak_duration = ""     # string | optional+computed | Time needed after draining entire blue pool. After this peri…

          standard_rollout_policy { # list [0..1]
            batch_node_count    = 0      # number | optional+computed | Number of blue nodes to drain in a batch.
            batch_percentage    = 0      # number | optional+computed | Percentage of the bool pool nodes to drain in a batch. The r…
            batch_soak_duration = ""     # string | optional | Soak time after each batch gets drained.  																		…

          }

        }

      }

    }

    resource_limits { # list
      resource_type = ""     # string | required | The type of the resource. For example, cpu and memory. See t…
      maximum       = 0      # number | optional | Maximum amount of the resource in the cluster.
      minimum       = 0      # number | optional | Minimum amount of the resource in the cluster.

    }

  }

  confidential_nodes { # list [0..1]
    enabled = false  # bool | required | Whether Confidential Nodes feature is enabled for all nodes …

  }

  cost_management_config { # list [0..1]
    enabled = false  # bool | required | Whether to enable GKE cost allocation. When you enable GKE c…

  }

  database_encryption { # list [0..1]
    state    = ""     # string | required | ENCRYPTED or DECRYPTED.
    key_name = ""     # string | optional | The key to use to encrypt/decrypt secrets.

  }

  default_snat_status { # list [0..1]
    disabled = false  # bool | required | When disabled is set to false, default IP masquerade rules w…

  }

  dns_config { # list [0..1]
    cluster_dns        = ""     # string | optional | Which in-cluster DNS provider should be used.
    cluster_dns_domain = ""     # string | optional | The suffix used for all cluster service records.
    cluster_dns_scope  = ""     # string | optional | The scope of access to cluster DNS records.

  }

  enable_k8s_beta_apis { # list [0..1]
    enabled_apis = []     # set(string) | required | Enabled Kubernetes Beta APIs.

  }

  fleet { # list [0..1]
    project             = ""     # string | optional | The Fleet host project of the cluster.

    # membership          = ""     # string | computed | Full resource name of the registered fleet membership of the…
    # membership_id       = ""     # string | computed | Short name of the fleet membership, for example "member-1".
    # membership_location = ""     # string | computed | Location of the fleet membership, for example "us-central1".
    # pre_registered      = false  # bool | computed | Whether the cluster has been registered via the fleet API.

  }

  gateway_api_config { # list [0..1]
    channel = ""     # string | required | The Gateway API release channel to use for Gateway API.

  }

  identity_service_config { # list [0..1]
    enabled = false  # bool | optional | Whether to enable the Identity Service component.

  }

  ip_allocation_policy { # list [0..1]
    cluster_ipv4_cidr_block       = ""     # string | optional+computed | The IP address range for the cluster pod IPs. Set to blank t…
    cluster_secondary_range_name  = ""     # string | optional+computed | The name of the existing secondary range in the cluster's su…
    services_ipv4_cidr_block      = ""     # string | optional+computed | The IP address range of the services IPs in this cluster. Se…
    services_secondary_range_name = ""     # string | optional+computed | The name of the existing secondary range in the cluster's su…
    stack_type                    = ""     # string | optional | The IP Stack type of the cluster. Choose between IPV4 and IP…

    additional_pod_ranges_config { # list [0..1]
      pod_range_names = []     # set(string) | required | Name for pod secondary ipv4 range which has the actual range…

    }

    pod_cidr_overprovision_config { # list [0..1]
      disabled = false  # bool | required

    }

  }

  logging_config { # list [0..1]
    enable_components = []     # list(string) | required | GKE components exposing logs. Valid values include SYSTEM_CO…

  }

  maintenance_policy { # list [0..1]

    daily_maintenance_window { # list [0..1]
      start_time = ""     # string | required

      # duration   = ""     # string | computed

    }

    maintenance_exclusion { # set [0..20]
      end_time       = ""     # string | required
      exclusion_name = ""     # string | required
      start_time     = ""     # string | required

      exclusion_options { # list [0..1]
        scope = ""     # string | required | The scope of automatic upgrades to restrict in the exclusion…

      }

    }

    recurring_window { # list [0..1]
      end_time   = ""     # string | required
      recurrence = ""     # string | required
      start_time = ""     # string | required

    }

  }

  master_auth { # list [0..1]

    # client_certificate     = ""     # string | computed | Base64 encoded public certificate used by clients to authent…
    # client_key             = ""     # string | computed+sensitive | Base64 encoded private key used by clients to authenticate t…
    # cluster_ca_certificate = ""     # string | computed | Base64 encoded public certificate that is the root of trust …

    client_certificate_config { # list [1..1]
      issue_client_certificate = false  # bool | required | Whether client certificate authorization is enabled for this…

    }

  }

  master_authorized_networks_config { # list [0..1]
    gcp_public_cidrs_access_enabled = false  # bool | optional+computed | Whether Kubernetes master is accessible via Google Compute E…

    cidr_blocks { # set
      cidr_block   = ""     # string | required | External network that can access Kubernetes master through H…
      display_name = ""     # string | optional | Field for users to identify CIDR blocks.

    }

  }

  mesh_certificates { # list [0..1]
    enable_certificates = false  # bool | required | When enabled the GKE Workload Identity Certificates controll…

  }

  monitoring_config { # list [0..1]
    enable_components = []     # list(string) | optional+computed | GKE components exposing metrics. Valid values include SYSTEM…

    advanced_datapath_observability_config { # list [0..1]
      enable_metrics = false  # bool | required | Whether or not the advanced datapath metrics are enabled.
      enable_relay   = false  # bool | optional | Whether or not Relay is enabled.
      relay_mode     = ""     # string | optional+computed+DEPRECATED | Mode used to make Relay available.

    }

    managed_prometheus { # list [0..1]
      enabled = false  # bool | required | Whether or not the managed collection is enabled.

    }

  }

  network_policy { # list [0..1]
    enabled  = false  # bool | required | Whether network policy is enabled on the cluster.
    provider = ""     # string | optional | The selected network policy provider.

  }

  node_config { # list [0..1]
    boot_disk_kms_key           = ""     # string | optional | The Customer Managed Encryption Key used to encrypt the boot…
    disk_size_gb                = 0      # number | optional+computed | Size of the disk attached to each node, specified in GB. The…
    disk_type                   = ""     # string | optional+computed | Type of the disk attached to each node. Such as pd-standard,…
    enable_confidential_storage = false  # bool | optional | If enabled boot disks are configured with confidential mode.
    guest_accelerator           = []     # list(object({ count: number, gpu_driver_installation_config: list(object({ gpu_driver_version: string })), gpu_partition_size: string, gpu_sharing_config: list(object({ gpu_sharing_strategy: string, max_shared_clients_per_gpu: number })), type: string })) | optional+computed | List of the type and count of accelerator cards attached to …
    image_type                  = ""     # string | optional+computed | The image type to use for this node. Note that for a given i…
    labels                      = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
    local_ssd_count             = 0      # number | optional+computed | The number of local SSD disks to be attached to the node.
    logging_variant             = ""     # string | optional+computed | Type of logging agent that is used as the default value for …
    machine_type                = ""     # string | optional+computed | The name of a Google Compute Engine machine type.
    metadata                    = {}     # map(string) | optional+computed | The metadata key/value pairs assigned to instances in the cl…
    min_cpu_platform            = ""     # string | optional+computed | Minimum CPU platform to be used by this instance. The instan…
    node_group                  = ""     # string | optional | Setting this field will assign instances of this pool to run…
    oauth_scopes                = []     # set(string) | optional+computed | The set of Google API scopes to be made available on all of …
    preemptible                 = false  # bool | optional | Whether the nodes are created as preemptible VM instances.
    resource_labels             = {}     # map(string) | optional | The GCE resource labels (a map of key/value pairs) to be app…
    resource_manager_tags       = {}     # map(string) | optional | A map of resource manager tags. Resource manager tag keys an…
    service_account             = ""     # string | optional+computed | The Google Cloud Platform Service Account to be used by the …
    spot                        = false  # bool | optional | Whether the nodes are created as spot VM instances.
    tags                        = []     # list(string) | optional | The list of instance tags applied to all nodes.

    # effective_taints = [  # list(object)
    #   {
    #     effect = ""
    #     key = ""
    #     value = ""
    #   }
    # ]

    advanced_machine_features { # list [0..1]
      threads_per_core             = 0      # number | required | The number of threads per physical core. To disable simultan…
      enable_nested_virtualization = false  # bool | optional | Whether the node should have nested virtualization enabled.

    }

    confidential_nodes { # list [0..1]
      enabled = false  # bool | required | Whether Confidential Nodes feature is enabled for all nodes …

    }

    containerd_config { # list [0..1]

      private_registry_access_config { # list [0..1]
        enabled = false  # bool | required | Whether or not private registries are configured.

        certificate_authority_domain_config { # list
          fqdns = []     # list(string) | required | List of fully-qualified-domain-names. IPv4s and port specifi…

          gcp_secret_manager_certificate_config { # list [1..1]
            secret_uri = ""     # string | required | URI for the secret that hosts a certificate. Must be in the …

          }

        }

      }

    }

    ephemeral_storage_local_ssd_config { # list [0..1]
      local_ssd_count = 0      # number | required | Number of local SSDs to use to back ephemeral storage. Uses …

    }

    fast_socket { # list [0..1]
      enabled = false  # bool | required | Whether or not NCCL Fast Socket is enabled

    }

    gcfs_config { # list [0..1]
      enabled = false  # bool | required | Whether or not GCFS is enabled

    }

    gvnic { # list [0..1]
      enabled = false  # bool | required | Whether or not gvnic is enabled

    }

    host_maintenance_policy { # list [0..1]
      maintenance_interval = ""     # string | required | .

    }

    kubelet_config { # list [0..1]
      cpu_manager_policy                     = ""     # string | required | Control the CPU management policy on the node.
      cpu_cfs_quota                          = false  # bool | optional | Enable CPU CFS quota enforcement for containers that specify…
      cpu_cfs_quota_period                   = ""     # string | optional | Set the CPU CFS quota period value 'cpu.cfs_period_us'.
      insecure_kubelet_readonly_port_enabled = ""     # string | optional+computed | Controls whether the kubelet read-only port is enabled. It i…
      pod_pids_limit                         = 0      # number | optional | Controls the maximum number of processes allowed to run in a…

    }

    linux_node_config { # list [0..1]
      cgroup_mode = ""     # string | optional+computed | cgroupMode specifies the cgroup mode to be used on the node.
      sysctls     = {}     # map(string) | optional | The Linux kernel parameters to be applied to the nodes and a…

    }

    local_nvme_ssd_block_config { # list [0..1]
      local_ssd_count = 0      # number | required | Number of raw-block local NVMe SSD disks to be attached to t…

    }

    reservation_affinity { # list [0..1]
      consume_reservation_type = ""     # string | required | Corresponds to the type of reservation consumption.
      key                      = ""     # string | optional | The label key of a reservation resource.
      values                   = []     # set(string) | optional | The label values of the reservation resource.

    }

    secondary_boot_disks { # list [0..127]
      disk_image = ""     # string | required | Disk image to create the secondary boot disk from
      mode       = ""     # string | optional | Mode for how the secondary boot disk is used.

    }

    shielded_instance_config { # list [0..1]
      enable_integrity_monitoring = false  # bool | optional | Defines whether the instance has integrity monitoring enable…
      enable_secure_boot          = false  # bool | optional | Defines whether the instance has Secure Boot enabled.

    }

    sole_tenant_config { # list [0..1]

      node_affinity { # set [1..*]
        key      = ""     # string | required | .
        operator = ""     # string | required | .
        values   = []     # list(string) | required | .

      }

    }

    taint { # list
      effect = ""     # string | required | Effect for taint.
      key    = ""     # string | required | Key for taint.
      value  = ""     # string | required | Value for taint.

    }

    workload_metadata_config { # list [0..1]
      mode = ""     # string | required | Mode is the configuration for how to expose metadata to work…

    }

  }

  node_pool { # list
    initial_node_count          = 0      # number | optional+computed | The initial number of nodes for the pool. In regional or mul…
    max_pods_per_node           = 0      # number | optional+computed | The maximum number of pods per node in this node pool. Note …
    name                        = ""     # string | optional+computed | The name of the node pool. If left blank, Terraform will aut…
    name_prefix                 = ""     # string | optional+computed | Creates a unique name for the node pool beginning with the s…
    node_count                  = 0      # number | optional+computed | The number of nodes per instance group. This field can be us…
    node_locations              = []     # set(string) | optional+computed | The list of zones in which the node pool's nodes should be l…
    version                     = ""     # string | optional+computed | The Kubernetes version for the nodes in this pool. Note that…

    # instance_group_urls         = []     # list(string) | computed | The resource URLs of the managed instance groups associated …
    # managed_instance_group_urls = []     # list(string) | computed | List of instance group URLs which have been assigned to this…

    autoscaling { # list [0..1]
      location_policy      = ""     # string | optional+computed | Location policy specifies the algorithm used when scaling-up…
      max_node_count       = 0      # number | optional | Maximum number of nodes per zone in the node pool. Must be >…
      min_node_count       = 0      # number | optional | Minimum number of nodes per zone in the node pool. Must be >…
      total_max_node_count = 0      # number | optional | Maximum number of all nodes in the node pool. Must be >= tot…
      total_min_node_count = 0      # number | optional | Minimum number of all nodes in the node pool. Must be >=0 an…

    }

    management { # list [0..1]
      auto_repair  = false  # bool | optional | Whether the nodes will be automatically repaired. Enabled by…
      auto_upgrade = false  # bool | optional | Whether the nodes will be automatically upgraded. Enabled by…

    }

    network_config { # list [0..1]
      create_pod_range     = false  # bool | optional | Whether to create a new range for pod IPs in this node pool.…
      enable_private_nodes = false  # bool | optional+computed | Whether nodes have internal IP addresses only.
      pod_ipv4_cidr_block  = ""     # string | optional+computed | The IP address range for pod IPs in this node pool. Only app…
      pod_range            = ""     # string | optional+computed | The ID of the secondary range for pod IPs. If create_pod_ran…

      additional_node_network_configs { # list
        network    = ""     # string | optional | Name of the VPC where the additional interface belongs.
        subnetwork = ""     # string | optional | Name of the subnetwork where the additional interface belong…

      }

      additional_pod_network_configs { # list
        max_pods_per_node   = 0      # number | optional+computed | The maximum number of pods per node which use this pod netwo…
        secondary_pod_range = ""     # string | optional | The name of the secondary range on the subnet which provides…
        subnetwork          = ""     # string | optional | Name of the subnetwork where the additional pod network belo…

      }

      network_performance_config { # list [0..1]
        total_egress_bandwidth_tier = ""     # string | required | Specifies the total network bandwidth tier for the NodePool.

      }

      pod_cidr_overprovision_config { # list [0..1]
        disabled = false  # bool | required

      }

    }

    node_config { # list [0..1]
      boot_disk_kms_key           = ""     # string | optional | The Customer Managed Encryption Key used to encrypt the boot…
      disk_size_gb                = 0      # number | optional+computed | Size of the disk attached to each node, specified in GB. The…
      disk_type                   = ""     # string | optional+computed | Type of the disk attached to each node. Such as pd-standard,…
      enable_confidential_storage = false  # bool | optional | If enabled boot disks are configured with confidential mode.
      guest_accelerator           = []     # list(object({ count: number, gpu_driver_installation_config: list(object({ gpu_driver_version: string })), gpu_partition_size: string, gpu_sharing_config: list(object({ gpu_sharing_strategy: string, max_shared_clients_per_gpu: number })), type: string })) | optional+computed | List of the type and count of accelerator cards attached to …
      image_type                  = ""     # string | optional+computed | The image type to use for this node. Note that for a given i…
      labels                      = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
      local_ssd_count             = 0      # number | optional+computed | The number of local SSD disks to be attached to the node.
      logging_variant             = ""     # string | optional+computed | Type of logging agent that is used as the default value for …
      machine_type                = ""     # string | optional+computed | The name of a Google Compute Engine machine type.
      metadata                    = {}     # map(string) | optional+computed | The metadata key/value pairs assigned to instances in the cl…
      min_cpu_platform            = ""     # string | optional+computed | Minimum CPU platform to be used by this instance. The instan…
      node_group                  = ""     # string | optional | Setting this field will assign instances of this pool to run…
      oauth_scopes                = []     # set(string) | optional+computed | The set of Google API scopes to be made available on all of …
      preemptible                 = false  # bool | optional | Whether the nodes are created as preemptible VM instances.
      resource_labels             = {}     # map(string) | optional | The GCE resource labels (a map of key/value pairs) to be app…
      resource_manager_tags       = {}     # map(string) | optional | A map of resource manager tags. Resource manager tag keys an…
      service_account             = ""     # string | optional+computed | The Google Cloud Platform Service Account to be used by the …
      spot                        = false  # bool | optional | Whether the nodes are created as spot VM instances.
      tags                        = []     # list(string) | optional | The list of instance tags applied to all nodes.

      # effective_taints = [  # list(object)
      #   {
      #     effect = ""
      #     key = ""
      #     value = ""
      #   }
      # ]

      advanced_machine_features { # list [0..1]
        threads_per_core             = 0      # number | required | The number of threads per physical core. To disable simultan…
        enable_nested_virtualization = false  # bool | optional | Whether the node should have nested virtualization enabled.

      }

      confidential_nodes { # list [0..1]
        enabled = false  # bool | required | Whether Confidential Nodes feature is enabled for all nodes …

      }

      containerd_config { # list [0..1]

        private_registry_access_config { # list [0..1]
          enabled = false  # bool | required | Whether or not private registries are configured.

          certificate_authority_domain_config { # list
            fqdns = []     # list(string) | required | List of fully-qualified-domain-names. IPv4s and port specifi…

            gcp_secret_manager_certificate_config { # list [1..1]
              secret_uri = ""     # string | required | URI for the secret that hosts a certificate. Must be in the …

            }

          }

        }

      }

      ephemeral_storage_local_ssd_config { # list [0..1]
        local_ssd_count = 0      # number | required | Number of local SSDs to use to back ephemeral storage. Uses …

      }

      fast_socket { # list [0..1]
        enabled = false  # bool | required | Whether or not NCCL Fast Socket is enabled

      }

      gcfs_config { # list [0..1]
        enabled = false  # bool | required | Whether or not GCFS is enabled

      }

      gvnic { # list [0..1]
        enabled = false  # bool | required | Whether or not gvnic is enabled

      }

      host_maintenance_policy { # list [0..1]
        maintenance_interval = ""     # string | required | .

      }

      kubelet_config { # list [0..1]
        cpu_manager_policy                     = ""     # string | required | Control the CPU management policy on the node.
        cpu_cfs_quota                          = false  # bool | optional | Enable CPU CFS quota enforcement for containers that specify…
        cpu_cfs_quota_period                   = ""     # string | optional | Set the CPU CFS quota period value 'cpu.cfs_period_us'.
        insecure_kubelet_readonly_port_enabled = ""     # string | optional+computed | Controls whether the kubelet read-only port is enabled. It i…
        pod_pids_limit                         = 0      # number | optional | Controls the maximum number of processes allowed to run in a…

      }

      linux_node_config { # list [0..1]
        cgroup_mode = ""     # string | optional+computed | cgroupMode specifies the cgroup mode to be used on the node.
        sysctls     = {}     # map(string) | optional | The Linux kernel parameters to be applied to the nodes and a…

      }

      local_nvme_ssd_block_config { # list [0..1]
        local_ssd_count = 0      # number | required | Number of raw-block local NVMe SSD disks to be attached to t…

      }

      reservation_affinity { # list [0..1]
        consume_reservation_type = ""     # string | required | Corresponds to the type of reservation consumption.
        key                      = ""     # string | optional | The label key of a reservation resource.
        values                   = []     # set(string) | optional | The label values of the reservation resource.

      }

      secondary_boot_disks { # list [0..127]
        disk_image = ""     # string | required | Disk image to create the secondary boot disk from
        mode       = ""     # string | optional | Mode for how the secondary boot disk is used.

      }

      shielded_instance_config { # list [0..1]
        enable_integrity_monitoring = false  # bool | optional | Defines whether the instance has integrity monitoring enable…
        enable_secure_boot          = false  # bool | optional | Defines whether the instance has Secure Boot enabled.

      }

      sole_tenant_config { # list [0..1]

        node_affinity { # set [1..*]
          key      = ""     # string | required | .
          operator = ""     # string | required | .
          values   = []     # list(string) | required | .

        }

      }

      taint { # list
        effect = ""     # string | required | Effect for taint.
        key    = ""     # string | required | Key for taint.
        value  = ""     # string | required | Value for taint.

      }

      workload_metadata_config { # list [0..1]
        mode = ""     # string | required | Mode is the configuration for how to expose metadata to work…

      }

    }

    placement_policy { # list [0..1]
      type         = ""     # string | required | Type defines the type of placement policy
      policy_name  = ""     # string | optional | If set, refers to the name of a custom resource policy suppl…
      tpu_topology = ""     # string | optional | TPU placement topology for pod slice node pool. https://clou…

    }

    queued_provisioning { # list [0..1]
      enabled = false  # bool | required | Whether nodes in this node pool are obtainable solely throug…

    }

    upgrade_settings { # list [0..1]
      max_surge       = 0      # number | optional+computed | The number of additional nodes that can be added to the node…
      max_unavailable = 0      # number | optional+computed | The number of nodes that can be simultaneously unavailable d…
      strategy        = ""     # string | optional | Update strategy for the given nodepool.

      blue_green_settings { # list [0..1]
        node_pool_soak_duration = ""     # string | optional+computed | Time needed after draining entire blue pool. After this peri…

        standard_rollout_policy { # list [1..1]
          batch_node_count    = 0      # number | optional+computed | Number of blue nodes to drain in a batch.
          batch_percentage    = 0      # number | optional+computed | Percentage of the blue pool nodes to drain in a batch.
          batch_soak_duration = ""     # string | optional+computed | Soak time after each batch gets drained.

        }

      }

    }

  }

  node_pool_auto_config { # list [0..1]
    resource_manager_tags = {}     # map(string) | optional | A map of resource manager tags. Resource manager tag keys an…

    network_tags { # list [0..1]
      tags = []     # list(string) | optional | List of network tags applied to auto-provisioned node pools.

    }

    node_kubelet_config { # list [0..1]
      insecure_kubelet_readonly_port_enabled = ""     # string | optional+computed | Controls whether the kubelet read-only port is enabled. It i…

    }

  }

  node_pool_defaults { # list [0..1]

    node_config_defaults { # list [0..1]
      insecure_kubelet_readonly_port_enabled = ""     # string | optional+computed | Controls whether the kubelet read-only port is enabled. It i…
      logging_variant                        = ""     # string | optional+computed | Type of logging agent that is used as the default value for …

      containerd_config { # list [0..1]

        private_registry_access_config { # list [0..1]
          enabled = false  # bool | required | Whether or not private registries are configured.

          certificate_authority_domain_config { # list
            fqdns = []     # list(string) | required | List of fully-qualified-domain-names. IPv4s and port specifi…

            gcp_secret_manager_certificate_config { # list [1..1]
              secret_uri = ""     # string | required | URI for the secret that hosts a certificate. Must be in the …

            }

          }

        }

      }

    }

  }

  notification_config { # list [0..1]

    pubsub { # list [1..1]
      enabled = false  # bool | required | Whether or not the notification config is enabled
      topic   = ""     # string | optional | The pubsub topic to push upgrade notifications to. Must be i…

      filter { # list [0..1]
        event_type = []     # list(string) | required | Can be used to filter what notifications are sent. Valid val…

      }

    }

  }

  private_cluster_config { # list [0..1]
    enable_private_endpoint     = false  # bool | optional | When true, the cluster's private endpoint is used as the clu…
    enable_private_nodes        = false  # bool | optional | Enables the private cluster feature, creating a private endp…
    master_ipv4_cidr_block      = ""     # string | optional+computed | The IP range in CIDR notation to use for the hosted master n…
    private_endpoint_subnetwork = ""     # string | optional | Subnetwork in cluster's network where master's endpoint will…

    # peering_name                = ""     # string | computed | The name of the peering between this cluster and the Google …
    # private_endpoint            = ""     # string | computed | The internal IP address of this cluster's master endpoint.
    # public_endpoint             = ""     # string | computed | The external IP address of this cluster's master endpoint.

    master_global_access_config { # list [0..1]
      enabled = false  # bool | required | Whether the cluster master is accessible globally or not.

    }

  }

  release_channel { # list [0..1]
    channel = ""     # string | required | The selected release channel. Accepted values are: * UNSPECI…

  }

  resource_usage_export_config { # list [0..1]
    enable_network_egress_metering       = false  # bool | optional | Whether to enable network egress metering for this cluster. …
    enable_resource_consumption_metering = false  # bool | optional | Whether to enable resource consumption metering on this clus…

    bigquery_destination { # list [1..1]
      dataset_id = ""     # string | required | The ID of a BigQuery Dataset.

    }

  }

  security_posture_config { # list [0..1]
    mode               = ""     # string | optional+computed | Sets the mode of the Kubernetes security posture API's off-c…
    vulnerability_mode = ""     # string | optional+computed | Sets the mode of the Kubernetes security posture API's workl…

  }

  service_external_ips_config { # list [0..1]
    enabled = false  # bool | required | When enabled, services with external ips specified will be a…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

  vertical_pod_autoscaling { # list [0..1]
    enabled = false  # bool | required | Enables vertical pod autoscaling.

  }

  workload_identity_config { # list [0..1]
    workload_pool = ""     # string | optional | The workload pool to attach all Kubernetes service accounts …

  }

}

