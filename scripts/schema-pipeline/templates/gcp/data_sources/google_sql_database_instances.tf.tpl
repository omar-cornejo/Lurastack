# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_database_instances                           │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_database_instances" "this" {

  database_version = ""     # string | optional | To filter out the database instances which are of the specif…
  id               = ""     # string | optional+computed
  project          = ""     # string | optional | Project ID of the project that contains the instances.
  region           = ""     # string | optional | To filter out the database instances which are located in th…
  state            = ""     # string | optional | To filter out the database instances based on the current st…
  tier             = ""     # string | optional | To filter out the database instances based on the machine ty…
  zone             = ""     # string | optional | To filter out the database instances which are located in th…

  # instances = [  # list(object)
  #   {
  #     available_maintenance_versions = []  # list(string)
  #     clone = [  # list(object)
  #       {
  #         allocated_ip_range = ""
  #         database_names = []  # list(string)
  #         point_in_time = ""
  #         preferred_zone = ""
  #         source_instance_name = ""
  #       }
  #     ]
  #     connection_name = ""
  #     database_version = ""
  #     deletion_protection = false
  #     dns_name = ""
  #     encryption_key_name = ""
  #     first_ip_address = ""
  #     instance_type = ""
  #     ip_address = [  # list(object)
  #       {
  #         ip_address = ""
  #         time_to_retire = ""
  #         type = ""
  #       }
  #     ]
  #     maintenance_version = ""
  #     master_instance_name = ""
  #     name = ""
  #     private_ip_address = ""
  #     project = ""
  #     psc_service_attachment_link = ""
  #     public_ip_address = ""
  #     region = ""
  #     replica_configuration = [  # list(object)
  #       {
  #         ca_certificate = ""
  #         client_certificate = ""
  #         client_key = ""
  #         connect_retry_interval = 0
  #         dump_file_path = ""
  #         failover_target = false
  #         master_heartbeat_period = 0
  #         password = ""
  #         ssl_cipher = ""
  #         username = ""
  #         verify_server_certificate = false
  #       }
  #     ]
  #     restore_backup_context = [  # list(object)
  #       {
  #         backup_run_id = 0
  #         instance_id = ""
  #         project = ""
  #       }
  #     ]
  #     root_password = ""
  #     self_link = ""
  #     server_ca_cert = [  # list(object)
  #       {
  #         cert = ""
  #         common_name = ""
  #         create_time = ""
  #         expiration_time = ""
  #         sha1_fingerprint = ""
  #       }
  #     ]
  #     service_account_email_address = ""
  #     settings = [  # list(object)
  #       {
  #         activation_policy = ""
  #         active_directory_config = [  # list(object)
  #           {
  #             domain = ""
  #           }
  #         ]
  #         advanced_machine_features = [  # list(object)
  #           {
  #             threads_per_core = 0
  #           }
  #         ]
  #         availability_type = ""
  #         backup_configuration = [  # list(object)
  #           {
  #             backup_retention_settings = [  # list(object)
  #               {
  #                 retained_backups = 0
  #                 retention_unit = ""
  #               }
  #             ]
  #             binary_log_enabled = false
  #             enabled = false
  #             location = ""
  #             point_in_time_recovery_enabled = false
  #             start_time = ""
  #             transaction_log_retention_days = 0
  #           }
  #         ]
  #         collation = ""
  #         connector_enforcement = ""
  #         data_cache_config = [  # list(object)
  #           {
  #             data_cache_enabled = false
  #           }
  #         ]
  #         database_flags = [  # set(object)
  #           {
  #             name = ""
  #             value = ""
  #           }
  #         ]
  #         deletion_protection_enabled = false
  #         deny_maintenance_period = [  # list(object)
  #           {
  #             end_date = ""
  #             start_date = ""
  #             time = ""
  #           }
  #         ]
  #         disk_autoresize = false
  #         disk_autoresize_limit = 0
  #         disk_size = 0
  #         disk_type = ""
  #         edition = ""
  #         enable_dataplex_integration = false
  #         enable_google_ml_integration = false
  #         insights_config = [  # list(object)
  #           {
  #             query_insights_enabled = false
  #             query_plans_per_minute = 0
  #             query_string_length = 0
  #             record_application_tags = false
  #             record_client_address = false
  #           }
  #         ]
  #         ip_configuration = [  # list(object)
  #           {
  #             allocated_ip_range = ""
  #             authorized_networks = [  # set(object)
  #               {
  #                 expiration_time = ""
  #                 name = ""
  #                 value = ""
  #               }
  #             ]
  #             enable_private_path_for_google_cloud_services = false
  #             ipv4_enabled = false
  #             private_network = ""
  #             psc_config = [  # set(object)
  #               {
  #                 allowed_consumer_projects = []  # set(string)
  #                 psc_enabled = false
  #               }
  #             ]
  #             require_ssl = false
  #             server_ca_mode = ""
  #             ssl_mode = ""
  #           }
  #         ]
  #         location_preference = [  # list(object)
  #           {
  #             follow_gae_application = ""
  #             secondary_zone = ""
  #             zone = ""
  #           }
  #         ]
  #         maintenance_window = [  # list(object)
  #           {
  #             day = 0
  #             hour = 0
  #             update_track = ""
  #           }
  #         ]
  #         password_validation_policy = [  # list(object)
  #           {
  #             complexity = ""
  #             disallow_username_substring = false
  #             enable_password_policy = false
  #             min_length = 0
  #             password_change_interval = ""
  #             reuse_interval = 0
  #           }
  #         ]
  #         pricing_plan = ""
  #         sql_server_audit_config = [  # list(object)
  #           {
  #             bucket = ""
  #             retention_interval = ""
  #             upload_interval = ""
  #           }
  #         ]
  #         tier = ""
  #         time_zone = ""
  #         user_labels = {}  # map(string)
  #         version = 0
  #       }
  #     ]
  #   }
  # ]

}

