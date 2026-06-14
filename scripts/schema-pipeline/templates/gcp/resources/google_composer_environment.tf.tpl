# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_composer_environment                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_composer_environment" "this" {

  name             = ""     # string | required | Name of the environment.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for this environment. The labels map can…
  project          = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  region           = ""     # string | optional+computed | The location or Compute Engine region for the environment.

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  config { # list [0..1]
    environment_size = ""     # string | optional+computed | The size of the Cloud Composer environment. This field is su…
    node_count       = 0      # number | optional+computed | The number of nodes in the Kubernetes Engine cluster that wi…
    resilience_mode  = ""     # string | optional+computed | Whether high resilience is enabled or not. This field is sup…

    # airflow_uri      = ""     # string | computed | The URI of the Apache Airflow Web UI hosted within this envi…
    # dag_gcs_prefix   = ""     # string | computed | The Cloud Storage prefix of the DAGs for this environment. A…
    # gke_cluster      = ""     # string | computed | The Kubernetes Engine cluster used to run this environment.

    data_retention_config { # list [0..1]

      task_logs_retention_config { # list [1..*]
        storage_mode = ""     # string | optional | Whether logs in cloud logging only is enabled or not. This f…

      }

    }

    database_config { # list [0..1]
      machine_type = ""     # string | optional | Optional. Cloud SQL machine type used by Airflow database. I…
      zone         = ""     # string | optional | Optional. Cloud SQL database preferred zone.

    }

    encryption_config { # list [0..1]
      kms_key_name = ""     # string | required | Optional. Customer-managed Encryption Key available through …

    }

    maintenance_window { # list [0..1]
      end_time   = ""     # string | required | Maintenance window end time. It is used only to calculate th…
      recurrence = ""     # string | required | Maintenance window recurrence. Format is a subset of RFC-554…
      start_time = ""     # string | required | Start time of the first recurrence of the maintenance window…

    }

    master_authorized_networks_config { # list [0..1]
      enabled = false  # bool | required | Whether or not master authorized networks is enabled.

      cidr_blocks { # set
        cidr_block   = ""     # string | required | cidr_block must be specified in CIDR notation.
        display_name = ""     # string | optional | display_name is a field for users to identify CIDR blocks.

      }

    }

    node_config { # list [0..1]
      disk_size_gb         = 0      # number | optional+computed | The disk size in GB used for node VMs. Minimum size is 20GB.…
      enable_ip_masq_agent = false  # bool | optional+computed | Deploys 'ip-masq-agent' daemon set in the GKE cluster and de…
      ip_allocation_policy = []     # list(object({ cluster_ipv4_cidr_block: string, cluster_secondary_range_name: string, services_ipv4_cidr_block: string, services_secondary_range_name: string, use_ip_aliases: bool })) | optional+computed | Configuration for controlling how IPs are allocated in the G…
      machine_type         = ""     # string | optional+computed | The Compute Engine machine type used for cluster instances, …
      network              = ""     # string | optional+computed | The Compute Engine machine type used for cluster instances, …
      oauth_scopes         = []     # set(string) | optional+computed | The set of Google API scopes to be made available on all nod…
      service_account      = ""     # string | optional+computed | The Google Cloud Platform Service Account to be used by the …
      subnetwork           = ""     # string | optional | The Compute Engine subnetwork to be used for machine communi…
      tags                 = []     # set(string) | optional | The list of instance tags applied to all node VMs. Tags are …
      zone                 = ""     # string | optional+computed | The Compute Engine zone in which to deploy the VMs running t…

    }

    private_environment_config { # list [0..1]
      cloud_composer_connection_subnetwork   = ""     # string | optional+computed | When specified, the environment will use Private Service Con…
      cloud_composer_network_ipv4_cidr_block = ""     # string | optional+computed | The CIDR block from which IP range for Cloud Composer Networ…
      cloud_sql_ipv4_cidr_block              = ""     # string | optional+computed | The CIDR block from which IP range in tenant project will be…
      connection_type                        = ""     # string | optional+computed | Mode of internal communication within the Composer environme…
      enable_private_endpoint                = false  # bool | optional | If true, access to the public endpoint of the GKE cluster is…
      enable_privately_used_public_ips       = false  # bool | optional+computed | When enabled, IPs from public (non-RFC1918) ranges can be us…
      master_ipv4_cidr_block                 = ""     # string | optional+computed | The IP range in CIDR notation to use for the hosted master n…
      web_server_ipv4_cidr_block             = ""     # string | optional+computed | The CIDR block from which IP range for web server will be re…

    }

    recovery_config { # list [0..1]

      scheduled_snapshots_config { # list [0..1]
        enabled                    = false  # bool | required | When enabled, Cloud Composer periodically saves snapshots of…
        snapshot_creation_schedule = ""     # string | optional | Snapshot schedule, in the unix-cron format.
        snapshot_location          = ""     # string | optional | the URI of a bucket folder where to save the snapshot.
        time_zone                  = ""     # string | optional | A time zone for the schedule. This value is a time offset an…

      }

    }

    software_config { # list [0..1]
      airflow_config_overrides = {}     # map(string) | optional | Apache Airflow configuration properties to override. Propert…
      env_variables            = {}     # map(string) | optional | Additional environment variables to provide to the Apache Ai…
      image_version            = ""     # string | optional+computed | The version of the software running in the environment. This…
      pypi_packages            = {}     # map(string) | optional | Custom Python Package Index (PyPI) packages to be installed …
      python_version           = ""     # string | optional+computed | The major version of Python used to run the Apache Airflow s…
      scheduler_count          = 0      # number | optional+computed | The number of schedulers for Airflow. This field is supporte…

    }

    web_server_config { # list [0..1]
      machine_type = ""     # string | required | Optional. Machine type on which Airflow web server is runnin…

    }

    web_server_network_access_control { # list [0..1]

      allowed_ip_range { # set
        value       = ""     # string | required | IP address or range, defined using CIDR notation, of request…
        description = ""     # string | optional | A description of this ip range.

      }

    }

    workloads_config { # list [0..1]

      scheduler { # list [0..1]
        count      = 0      # number | optional+computed | The number of schedulers.
        cpu        = 0      # number | optional+computed | CPU request and limit for a single Airflow scheduler replica
        memory_gb  = 0      # number | optional+computed | Memory (GB) request and limit for a single Airflow scheduler…
        storage_gb = 0      # number | optional+computed | Storage (GB) request and limit for a single Airflow schedule…

      }

      triggerer { # list [0..1]
        count     = 0      # number | required | The number of triggerers.
        cpu       = 0      # number | required | CPU request and limit for a single Airflow triggerer replica…
        memory_gb = 0      # number | required | Memory (GB) request and limit for a single Airflow triggerer…

      }

      web_server { # list [0..1]
        cpu        = 0      # number | optional+computed | CPU request and limit for Airflow web server.
        memory_gb  = 0      # number | optional+computed | Memory (GB) request and limit for Airflow web server.
        storage_gb = 0      # number | optional+computed | Storage (GB) request and limit for Airflow web server.

      }

      worker { # list [0..1]
        cpu        = 0      # number | optional+computed | CPU request and limit for a single Airflow worker replica.
        max_count  = 0      # number | optional+computed | Maximum number of workers for autoscaling.
        memory_gb  = 0      # number | optional+computed | Memory (GB) request and limit for a single Airflow worker re…
        min_count  = 0      # number | optional+computed | Minimum number of workers for autoscaling.
        storage_gb = 0      # number | optional+computed | Storage (GB) request and limit for a single Airflow worker r…

      }

    }

  }

  storage_config { # list [0..1]
    bucket = ""     # string | required | Optional. Name of an existing Cloud Storage bucket to be use…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

