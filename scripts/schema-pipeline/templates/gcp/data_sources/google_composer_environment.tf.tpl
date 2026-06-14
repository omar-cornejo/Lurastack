# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_composer_environment                             │
# └──────────────────────────────────────────────────────────────┘
data "google_composer_environment" "this" {

  name             = ""     # string | required | Name of the environment.
  id               = ""     # string | optional+computed
  project          = ""     # string | optional | The ID of the project in which the resource belongs. If it i…
  region           = ""     # string | optional | The location or Compute Engine region for the environment.

  # config = [  # list(object)
  #   {
  #     airflow_uri = ""
  #     dag_gcs_prefix = ""
  #     data_retention_config = [  # list(object)
  #       {
  #         task_logs_retention_config = [  # list(object)
  #           {
  #             storage_mode = ""
  #           }
  #         ]
  #       }
  #     ]
  #     database_config = [  # list(object)
  #       {
  #         machine_type = ""
  #         zone = ""
  #       }
  #     ]
  #     encryption_config = [  # list(object)
  #       {
  #         kms_key_name = ""
  #       }
  #     ]
  #     environment_size = ""
  #     gke_cluster = ""
  #     maintenance_window = [  # list(object)
  #       {
  #         end_time = ""
  #         recurrence = ""
  #         start_time = ""
  #       }
  #     ]
  #     master_authorized_networks_config = [  # list(object)
  #       {
  #         cidr_blocks = [  # set(object)
  #           {
  #             cidr_block = ""
  #             display_name = ""
  #           }
  #         ]
  #         enabled = false
  #       }
  #     ]
  #     node_config = [  # list(object)
  #       {
  #         disk_size_gb = 0
  #         enable_ip_masq_agent = false
  #         ip_allocation_policy = [  # list(object)
  #           {
  #             cluster_ipv4_cidr_block = ""
  #             cluster_secondary_range_name = ""
  #             services_ipv4_cidr_block = ""
  #             services_secondary_range_name = ""
  #             use_ip_aliases = false
  #           }
  #         ]
  #         machine_type = ""
  #         network = ""
  #         oauth_scopes = []  # set(string)
  #         service_account = ""
  #         subnetwork = ""
  #         tags = []  # set(string)
  #         zone = ""
  #       }
  #     ]
  #     node_count = 0
  #     private_environment_config = [  # list(object)
  #       {
  #         cloud_composer_connection_subnetwork = ""
  #         cloud_composer_network_ipv4_cidr_block = ""
  #         cloud_sql_ipv4_cidr_block = ""
  #         connection_type = ""
  #         enable_private_endpoint = false
  #         enable_privately_used_public_ips = false
  #         master_ipv4_cidr_block = ""
  #         web_server_ipv4_cidr_block = ""
  #       }
  #     ]
  #     recovery_config = [  # list(object)
  #       {
  #         scheduled_snapshots_config = [  # list(object)
  #           {
  #             enabled = false
  #             snapshot_creation_schedule = ""
  #             snapshot_location = ""
  #             time_zone = ""
  #           }
  #         ]
  #       }
  #     ]
  #     resilience_mode = ""
  #     software_config = [  # list(object)
  #       {
  #         airflow_config_overrides = {}  # map(string)
  #         env_variables = {}  # map(string)
  #         image_version = ""
  #         pypi_packages = {}  # map(string)
  #         python_version = ""
  #         scheduler_count = 0
  #       }
  #     ]
  #     web_server_config = [  # list(object)
  #       {
  #         machine_type = ""
  #       }
  #     ]
  #     web_server_network_access_control = [  # list(object)
  #       {
  #         allowed_ip_range = [  # set(object)
  #           {
  #             description = ""
  #             value = ""
  #           }
  #         ]
  #       }
  #     ]
  #     workloads_config = [  # list(object)
  #       {
  #         scheduler = [  # list(object)
  #           {
  #             count = 0
  #             cpu = 0
  #             memory_gb = 0
  #             storage_gb = 0
  #           }
  #         ]
  #         triggerer = [  # list(object)
  #           {
  #             count = 0
  #             cpu = 0
  #             memory_gb = 0
  #           }
  #         ]
  #         web_server = [  # list(object)
  #           {
  #             cpu = 0
  #             memory_gb = 0
  #             storage_gb = 0
  #           }
  #         ]
  #         worker = [  # list(object)
  #           {
  #             cpu = 0
  #             max_count = 0
  #             memory_gb = 0
  #             min_count = 0
  #             storage_gb = 0
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # labels           = {}     # map(string) | computed | User-defined labels for this environment. The labels map can…
  # storage_config = [  # list(object)
  #   {
  #     bucket = ""
  #   }
  # ]
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

