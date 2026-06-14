# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_node_pool                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_node_pool" "this" {

  cluster                     = ""     # string | required | The cluster to create the node pool for. Cluster must be pre…
  id                          = ""     # string | optional+computed
  initial_node_count          = 0      # number | optional+computed | The initial number of nodes for the pool. In regional or mul…
  location                    = ""     # string | optional+computed | The location (region or zone) of the cluster.
  max_pods_per_node           = 0      # number | optional+computed | The maximum number of pods per node in this node pool. Note …
  name                        = ""     # string | optional+computed | The name of the node pool. If left blank, Terraform will aut…
  name_prefix                 = ""     # string | optional+computed | Creates a unique name for the node pool beginning with the s…
  node_count                  = 0      # number | optional+computed | The number of nodes per instance group. This field can be us…
  node_locations              = []     # set(string) | optional+computed | The list of zones in which the node pool's nodes should be l…
  project                     = ""     # string | optional+computed | The ID of the project in which to create the node pool. If b…
  version                     = ""     # string | optional+computed | The Kubernetes version for the nodes in this pool. Note that…

  # instance_group_urls         = []     # list(string) | computed | The resource URLs of the managed instance groups associated …
  # managed_instance_group_urls = []     # list(string) | computed | List of instance group URLs which have been assigned to this…
  # operation                   = ""     # string | computed

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

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

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

