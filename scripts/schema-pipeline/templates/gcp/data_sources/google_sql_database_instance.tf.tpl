# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_database_instance                            │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_database_instance" "this" {

  name                           = ""     # string | required | The name of the instance. If the name is left blank, Terrafo…
  id                             = ""     # string | optional+computed
  project                        = ""     # string | optional | The ID of the project in which the resource belongs. If it i…

  # available_maintenance_versions = []     # list(string) | computed | Available Maintenance versions.
  # clone = [  # list(object)
  #   {
  #     allocated_ip_range = ""
  #     database_names = []  # list(string)
  #     point_in_time = ""
  #     preferred_zone = ""
  #     source_instance_name = ""
  #   }
  # ]
  # connection_name                = ""     # string | computed | The connection name of the instance to be used in connection…
  # database_version               = ""     # string | computed | The MySQL, PostgreSQL or SQL Server (beta) version to use. S…
  # deletion_protection            = false  # bool | computed | Used to block Terraform from deleting a SQL Instance. Defaul…
  # dns_name                       = ""     # string | computed | The dns name of the instance.
  # encryption_key_name            = ""     # string | computed
  # first_ip_address               = ""     # string | computed | The first IPv4 address of any type assigned. This is to supp…
  # instance_type                  = ""     # string | computed | The type of the instance. The valid values are:- 'SQL_INSTAN…
  # ip_address = [  # list(object)
  #   {
  #     ip_address = ""
  #     time_to_retire = ""
  #     type = ""
  #   }
  # ]
  # maintenance_version            = ""     # string | computed | Maintenance version.
  # master_instance_name           = ""     # string | computed | The name of the instance that will act as the master in the …
  # private_ip_address             = ""     # string | computed | IPv4 address assigned. This is a workaround for an issue fix…
  # psc_service_attachment_link    = ""     # string | computed | The link to service attachment of PSC instance.
  # public_ip_address              = ""     # string | computed | IPv4 address assigned. This is a workaround for an issue fix…
  # region                         = ""     # string | computed | The region the instance will sit in. Note, Cloud SQL is not …
  # replica_configuration = [  # list(object)
  #   {
  #     ca_certificate = ""
  #     client_certificate = ""
  #     client_key = ""
  #     connect_retry_interval = 0
  #     dump_file_path = ""
  #     failover_target = false
  #     master_heartbeat_period = 0
  #     password = ""
  #     ssl_cipher = ""
  #     username = ""
  #     verify_server_certificate = false
  #   }
  # ]
  # restore_backup_context = [  # list(object)
  #   {
  #     backup_run_id = 0
  #     instance_id = ""
  #     project = ""
  #   }
  # ]
  # root_password                  = ""     # string | computed | Initial root password. Required for MS SQL Server.
  # self_link                      = ""     # string | computed | The URI of the created resource.
  # server_ca_cert = [  # list(object)
  #   {
  #     cert = ""
  #     common_name = ""
  #     create_time = ""
  #     expiration_time = ""
  #     sha1_fingerprint = ""
  #   }
  # ]
  # service_account_email_address  = ""     # string | computed | The service account email address assigned to the instance.
  # settings = [  # list(object)
  #   {
  #     activation_policy = ""
  #     active_directory_config = [  # list(object)
  #       {
  #         domain = ""
  #       }
  #     ]
  #     advanced_machine_features = [  # list(object)
  #       {
  #         threads_per_core = 0
  #       }
  #     ]
  #     availability_type = ""
  #     backup_configuration = [  # list(object)
  #       {
  #         backup_retention_settings = [  # list(object)
  #           {
  #             retained_backups = 0
  #             retention_unit = ""
  #           }
  #         ]
  #         binary_log_enabled = false
  #         enabled = false
  #         location = ""
  #         point_in_time_recovery_enabled = false
  #         start_time = ""
  #         transaction_log_retention_days = 0
  #       }
  #     ]
  #     collation = ""
  #     connector_enforcement = ""
  #     data_cache_config = [  # list(object)
  #       {
  #         data_cache_enabled = false
  #       }
  #     ]
  #     database_flags = [  # set(object)
  #       {
  #         name = ""
  #         value = ""
  #       }
  #     ]
  #     deletion_protection_enabled = false
  #     deny_maintenance_period = [  # list(object)
  #       {
  #         end_date = ""
  #         start_date = ""
  #         time = ""
  #       }
  #     ]
  #     disk_autoresize = false
  #     disk_autoresize_limit = 0
  #     disk_size = 0
  #     disk_type = ""
  #     edition = ""
  #     enable_dataplex_integration = false
  #     enable_google_ml_integration = false
  #     insights_config = [  # list(object)
  #       {
  #         query_insights_enabled = false
  #         query_plans_per_minute = 0
  #         query_string_length = 0
  #         record_application_tags = false
  #         record_client_address = false
  #       }
  #     ]
  #     ip_configuration = [  # list(object)
  #       {
  #         allocated_ip_range = ""
  #         authorized_networks = [  # set(object)
  #           {
  #             expiration_time = ""
  #             name = ""
  #             value = ""
  #           }
  #         ]
  #         enable_private_path_for_google_cloud_services = false
  #         ipv4_enabled = false
  #         private_network = ""
  #         psc_config = [  # set(object)
  #           {
  #             allowed_consumer_projects = []  # set(string)
  #             psc_enabled = false
  #           }
  #         ]
  #         require_ssl = false
  #         server_ca_mode = ""
  #         ssl_mode = ""
  #       }
  #     ]
  #     location_preference = [  # list(object)
  #       {
  #         follow_gae_application = ""
  #         secondary_zone = ""
  #         zone = ""
  #       }
  #     ]
  #     maintenance_window = [  # list(object)
  #       {
  #         day = 0
  #         hour = 0
  #         update_track = ""
  #       }
  #     ]
  #     password_validation_policy = [  # list(object)
  #       {
  #         complexity = ""
  #         disallow_username_substring = false
  #         enable_password_policy = false
  #         min_length = 0
  #         password_change_interval = ""
  #         reuse_interval = 0
  #       }
  #     ]
  #     pricing_plan = ""
  #     sql_server_audit_config = [  # list(object)
  #       {
  #         bucket = ""
  #         retention_interval = ""
  #         upload_interval = ""
  #       }
  #     ]
  #     tier = ""
  #     time_zone = ""
  #     user_labels = {}  # map(string)
  #     version = 0
  #   }
  # ]

}

