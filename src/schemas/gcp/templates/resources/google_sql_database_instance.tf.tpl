# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sql_database_instance                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_sql_database_instance" "this" {

  database_version               = ""     # string | required | The MySQL, PostgreSQL or SQL Server (beta) version to use. S…
  deletion_protection            = false  # bool | optional | Used to block Terraform from deleting a SQL Instance. Defaul…
  encryption_key_name            = ""     # string | optional+computed
  id                             = ""     # string | optional+computed
  instance_type                  = ""     # string | optional+computed | The type of the instance. The valid values are:- 'SQL_INSTAN…
  maintenance_version            = ""     # string | optional+computed | Maintenance version.
  master_instance_name           = ""     # string | optional+computed | The name of the instance that will act as the master in the …
  name                           = ""     # string | optional+computed | The name of the instance. If the name is left blank, Terrafo…
  project                        = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  region                         = ""     # string | optional+computed | The region the instance will sit in. Note, Cloud SQL is not …
  root_password                  = ""     # string | optional+sensitive | Initial root password. Required for MS SQL Server.

  # available_maintenance_versions = []     # list(string) | computed | Available Maintenance versions.
  # connection_name                = ""     # string | computed | The connection name of the instance to be used in connection…
  # dns_name                       = ""     # string | computed | The dns name of the instance.
  # first_ip_address               = ""     # string | computed | The first IPv4 address of any type assigned. This is to supp…
  # ip_address = [  # list(object)
  #   {
  #     ip_address = ""
  #     time_to_retire = ""
  #     type = ""
  #   }
  # ]
  # private_ip_address             = ""     # string | computed | IPv4 address assigned. This is a workaround for an issue fix…
  # psc_service_attachment_link    = ""     # string | computed | The link to service attachment of PSC instance.
  # public_ip_address              = ""     # string | computed | IPv4 address assigned. This is a workaround for an issue fix…
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

  clone { # list [0..1]
    source_instance_name = ""     # string | required | The name of the instance from which the point in time should…
    allocated_ip_range   = ""     # string | optional | The name of the allocated ip range for the private ip CloudS…
    database_names       = []     # list(string) | optional | (SQL Server only, use with point_in_time) clone only the spe…
    point_in_time        = ""     # string | optional | The timestamp of the point in time that should be restored.
    preferred_zone       = ""     # string | optional | (Point-in-time recovery for PostgreSQL only) Clone to an ins…

  }

  replica_configuration { # list [0..1]
    ca_certificate            = ""     # string | optional | PEM representation of the trusted CA's x509 certificate.
    client_certificate        = ""     # string | optional | PEM representation of the replica's x509 certificate.
    client_key                = ""     # string | optional | PEM representation of the replica's private key. The corresp…
    connect_retry_interval    = 0      # number | optional | The number of seconds between connect retries. MySQL's defau…
    dump_file_path            = ""     # string | optional | Path to a SQL file in Google Cloud Storage from which replic…
    failover_target           = false  # bool | optional | Specifies if the replica is the failover target. If the fiel…
    master_heartbeat_period   = 0      # number | optional | Time in ms between replication heartbeats.
    password                  = ""     # string | optional+sensitive | Password for the replication connection.
    ssl_cipher                = ""     # string | optional | Permissible ciphers for use in SSL encryption.
    username                  = ""     # string | optional | Username for replication connection.
    verify_server_certificate = false  # bool | optional | True if the master's common name value is checked during the…

  }

  restore_backup_context { # list [0..1]
    backup_run_id = 0      # number | required | The ID of the backup run to restore from.
    instance_id   = ""     # string | optional | The ID of the instance that the backup was taken from.
    project       = ""     # string | optional | The full project ID of the source instance.

  }

  settings { # list [0..1]
    tier                         = ""     # string | required | The machine type to use. See tiers for more details and supp…
    activation_policy            = ""     # string | optional | This specifies when the instance should be active. Can be ei…
    availability_type            = ""     # string | optional | The availability type of the Cloud SQL instance, high availa…
    collation                    = ""     # string | optional | The name of server instance collation.
    connector_enforcement        = ""     # string | optional+computed | Enables the enforcement of Cloud SQL Auth Proxy or Cloud SQL…
    deletion_protection_enabled  = false  # bool | optional | Configuration to protect against accidental instance deletio…
    disk_autoresize              = false  # bool | optional | Enables auto-resizing of the storage size. Defaults to true.
    disk_autoresize_limit        = 0      # number | optional | The maximum size, in GB, to which storage capacity can be au…
    disk_size                    = 0      # number | optional+computed | The size of data disk, in GB. Size of a running instance can…
    disk_type                    = ""     # string | optional | The type of data disk: PD_SSD or PD_HDD. Defaults to PD_SSD.
    edition                      = ""     # string | optional | The edition of the instance, can be ENTERPRISE or ENTERPRISE…
    enable_dataplex_integration  = false  # bool | optional | Enables Dataplex Integration.
    enable_google_ml_integration = false  # bool | optional | Enables Vertex AI Integration.
    pricing_plan                 = ""     # string | optional | Pricing plan for this instance, can only be PER_USE.
    time_zone                    = ""     # string | optional | The time_zone to be used by the database engine (supported o…
    user_labels                  = {}     # map(string) | optional+computed | A set of key/value user label pairs to assign to the instanc…

    # version                      = 0      # number | computed | Used to make sure changes to the settings block are atomic.

    active_directory_config { # list [0..1]
      domain = ""     # string | required | Domain name of the Active Directory for SQL Server (e.g., my…

    }

    advanced_machine_features { # list [0..1]
      threads_per_core = 0      # number | optional | The number of threads per physical core. Can be 1 or 2.

    }

    backup_configuration { # list [0..1]
      binary_log_enabled             = false  # bool | optional | True if binary logging is enabled. If settings.backup_config…
      enabled                        = false  # bool | optional | True if backup configuration is enabled.
      location                       = ""     # string | optional | Location of the backup configuration.
      point_in_time_recovery_enabled = false  # bool | optional | True if Point-in-time recovery is enabled.
      start_time                     = ""     # string | optional+computed | HH:MM format time indicating when backup configuration start…
      transaction_log_retention_days = 0      # number | optional+computed | The number of days of transaction logs we retain for point i…

      backup_retention_settings { # list [0..1]
        retained_backups = 0      # number | required | Number of backups to retain.
        retention_unit   = ""     # string | optional | The unit that 'retainedBackups' represents. Defaults to COUN…

      }

    }

    data_cache_config { # list [0..1]
      data_cache_enabled = false  # bool | optional | Whether data cache is enabled for the instance.

    }

    database_flags { # set
      name  = ""     # string | required | Name of the flag.
      value = ""     # string | required | Value of the flag.

    }

    deny_maintenance_period { # list [0..1]
      end_date   = ""     # string | required | End date before which maintenance will not take place. The d…
      start_date = ""     # string | required | Start date after which maintenance will not take place. The …
      time       = ""     # string | required | Time in UTC when the "deny maintenance period" starts on sta…

    }

    insights_config { # list [0..1]
      query_insights_enabled  = false  # bool | optional | True if Query Insights feature is enabled.
      query_plans_per_minute  = 0      # number | optional+computed | Number of query execution plans captured by Insights per min…
      query_string_length     = 0      # number | optional | Maximum query length stored in bytes. Between 256 and 4500. …
      record_application_tags = false  # bool | optional | True if Query Insights will record application tags from que…
      record_client_address   = false  # bool | optional | True if Query Insights will record client address when enabl…

    }

    ip_configuration { # list [0..1]
      allocated_ip_range                            = ""     # string | optional | The name of the allocated ip range for the private ip CloudS…
      enable_private_path_for_google_cloud_services = false  # bool | optional | Whether Google Cloud services such as BigQuery are allowed t…
      ipv4_enabled                                  = false  # bool | optional | Whether this Cloud SQL instance should be assigned a public …
      private_network                               = ""     # string | optional | The VPC network from which the Cloud SQL instance is accessi…
      require_ssl                                   = false  # bool | optional+DEPRECATED | Whether SSL connections over IP are enforced or not. To chan…
      server_ca_mode                                = ""     # string | optional+computed | Specify how the server certificate's Certificate Authority i…
      ssl_mode                                      = ""     # string | optional+computed | Specify how SSL connection should be enforced in DB connecti…

      authorized_networks { # set
        value           = ""     # string | required
        expiration_time = ""     # string | optional
        name            = ""     # string | optional

      }

      psc_config { # set
        allowed_consumer_projects = []     # set(string) | optional | List of consumer projects that are allow-listed for PSC conn…
        psc_enabled               = false  # bool | optional | Whether PSC connectivity is enabled for this instance.

      }

    }

    location_preference { # list [0..1]
      follow_gae_application = ""     # string | optional | A Google App Engine application whose zone to remain in. Mus…
      secondary_zone         = ""     # string | optional | The preferred Compute Engine zone for the secondary/failover
      zone                   = ""     # string | optional | The preferred compute engine zone.

    }

    maintenance_window { # list [0..1]
      day          = 0      # number | optional | Day of week (1-7), starting on Monday
      hour         = 0      # number | optional | Hour of day (0-23), ignored if day not set
      update_track = ""     # string | optional | Receive updates after one week (canary) or after two weeks (…

    }

    password_validation_policy { # list [0..1]
      enable_password_policy      = false  # bool | required | Whether the password policy is enabled or not.
      complexity                  = ""     # string | optional | Password complexity.
      disallow_username_substring = false  # bool | optional | Disallow username as a part of the password.
      min_length                  = 0      # number | optional | Minimum number of characters allowed.
      password_change_interval    = ""     # string | optional | Minimum interval after which the password can be changed. Th…
      reuse_interval              = 0      # number | optional | Number of previous passwords that cannot be reused.

    }

    sql_server_audit_config { # list [0..1]
      bucket             = ""     # string | optional | The name of the destination bucket (e.g., gs://mybucket).
      retention_interval = ""     # string | optional | How long to keep generated audit files. A duration in second…
      upload_interval    = ""     # string | optional | How often to upload generated audit files. A duration in sec…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

