# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_database_migration_service_connection_profile  │
# └──────────────────────────────────────────────────────────────┘
resource "google_database_migration_service_connection_profile" "this" {

  connection_profile_id = ""     # string | required | The ID of the connection profile.
  display_name          = ""     # string | optional | The connection profile display name.
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | The resource labels for connection profile to use to annotat…
  location              = ""     # string | optional | The location where the connection profile should reside.
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Output only. The timestamp when the resource was created. A …
  # dbprovider            = ""     # string | computed | The database provider.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # error = [  # list(object)
  #   {
  #     code = 0
  #     details = []  # list(map(string))
  #     message = ""
  #   }
  # ]
  # name                  = ""     # string | computed | The name of this connection profile resource in the form of …
  # state                 = ""     # string | computed | The current connection profile state.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  alloydb { # list [0..1]
    cluster_id = ""     # string | required | Required. The AlloyDB cluster ID that this connection profil…

    settings { # list [0..1]
      vpc_network = ""     # string | required | Required. The resource link for the VPC network in which clu…
      labels      = {}     # map(string) | optional | Labels for the AlloyDB cluster created by DMS.

      initial_user { # list [1..1]
        password     = ""     # string | required+sensitive | The initial password for the user.
        user         = ""     # string | required | The database username.

        # password_set = false  # bool | computed | Output only. Indicates if the initialUser.password field has…

      }

      primary_instance_settings { # list [0..1]
        id             = ""     # string | required | The database username.
        database_flags = {}     # map(string) | optional | Database flags to pass to AlloyDB when DMS is creating the A…
        labels         = {}     # map(string) | optional | Labels for the AlloyDB primary instance created by DMS.

        # private_ip     = ""     # string | computed | Output only. The private IP address for the Instance. This i…

        machine_config { # list [1..1]
          cpu_count = 0      # number | required | The number of CPU's in the VM instance.

        }

      }

    }

  }

  cloudsql { # list [0..1]

    # cloud_sql_id = ""     # string | computed | Output only. The Cloud SQL instance ID that this connection …
    # private_ip   = ""     # string | computed | Output only. The Cloud SQL database instance's private IP.
    # public_ip    = ""     # string | computed | Output only. The Cloud SQL database instance's public IP.

    settings { # list [0..1]
      source_id                 = ""     # string | required | The Database Migration Service source connection profile ID,…
      activation_policy         = ""     # string | optional | The activation policy specifies when the instance is activat…
      auto_storage_increase     = false  # bool | optional | If you enable this setting, Cloud SQL checks your available …
      cmek_key_name             = ""     # string | optional | The KMS key name used for the csql instance.
      collation                 = ""     # string | optional | The Cloud SQL default instance level collation.
      data_disk_size_gb         = ""     # string | optional | The storage capacity available to the database, in GB. The m…
      data_disk_type            = ""     # string | optional | The type of storage. Possible values: ["PD_SSD", "PD_HDD"]
      database_flags            = {}     # map(string) | optional | The database flags passed to the Cloud SQL instance at start…
      database_version          = ""     # string | optional | The database engine type and version. Currently supported va…
      edition                   = ""     # string | optional | The edition of the given Cloud SQL instance. Possible values…
      root_password             = ""     # string | optional+sensitive | Input only. Initial root password.
      storage_auto_resize_limit = ""     # string | optional | The maximum size to which storage capacity can be automatica…
      tier                      = ""     # string | optional | The tier (or machine type) for this instance, for example: d…
      user_labels               = {}     # map(string) | optional | The resource labels for a Cloud SQL instance to use to annot…
      zone                      = ""     # string | optional | The Google Cloud Platform zone where your Cloud SQL datdabse…

      # root_password_set         = false  # bool | computed | Output only. Indicates If this connection profile root passw…

      ip_config { # list [0..1]
        enable_ipv4     = false  # bool | optional | Whether the instance should be assigned an IPv4 address or n…
        private_network = ""     # string | optional | The resource link for the VPC network from which the Cloud S…
        require_ssl     = false  # bool | optional | Whether SSL connections over IP should be enforced or not.

        authorized_networks { # list
          value       = ""     # string | required | The allowlisted value for the access control list.
          expire_time = ""     # string | optional | The time when this access control entry expires in RFC 3339 …
          label       = ""     # string | optional | A label to identify this entry.
          ttl         = ""     # string | optional | Input only. The time-to-leave of this access control entry.

        }

      }

    }

  }

  mysql { # list [0..1]
    host         = ""     # string | required | Required. The IP or hostname of the source MySQL database.
    password     = ""     # string | required+sensitive | Required. Input only. The password for the user that Databas…
    port         = 0      # number | required | Required. The network port of the source MySQL database.
    username     = ""     # string | required | Required. The username that Database Migration Service will …
    cloud_sql_id = ""     # string | optional | If the source is a Cloud SQL database, use this field to pro…

    # password_set = false  # bool | computed | Output only. Indicates If this connection profile password i…

    ssl { # list [0..1]
      ca_certificate     = ""     # string | required+sensitive | Required. Input only. The x509 PEM-encoded certificate of th…
      client_certificate = ""     # string | optional+sensitive | Input only. The x509 PEM-encoded certificate that will be us…
      client_key         = ""     # string | optional+sensitive | Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded pri…

      # type               = ""     # string | computed | The current connection profile state.

    }

  }

  oracle { # list [0..1]
    database_service = ""     # string | required | Required. Database service for the Oracle connection.
    host             = ""     # string | required | Required. The IP or hostname of the source Oracle database.
    password         = ""     # string | required+sensitive | Required. Input only. The password for the user that Databas…
    port             = 0      # number | required | Required. The network port of the source Oracle database.
    username         = ""     # string | required | Required. The username that Database Migration Service will …

    # password_set     = false  # bool | computed | Output only. Indicates If this connection profile password i…

    forward_ssh_connectivity { # list [0..1]
      hostname    = ""     # string | required | Required. Hostname for the SSH tunnel.
      port        = 0      # number | required | Port for the SSH tunnel, default value is 22.
      username    = ""     # string | required | Required. Username for the SSH tunnel.
      password    = ""     # string | optional+sensitive | Input only. SSH password. Only one of 'password' and 'privat…
      private_key = ""     # string | optional+sensitive | Input only. SSH private key. Only one of 'password' and 'pri…

    }

    private_connectivity { # list [0..1]
      private_connection = ""     # string | required | Required. The resource name (URI) of the private connection.

    }

    ssl { # list [0..1]
      ca_certificate     = ""     # string | required+sensitive | Required. Input only. The x509 PEM-encoded certificate of th…
      client_certificate = ""     # string | optional+sensitive | Input only. The x509 PEM-encoded certificate that will be us…
      client_key         = ""     # string | optional+sensitive | Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded pri…

      # type               = ""     # string | computed | The current connection profile state.

    }

    static_service_ip_connectivity {} # list [0..1]

  }

  postgresql { # list [0..1]
    host                 = ""     # string | required | Required. The IP or hostname of the source MySQL database.
    password             = ""     # string | required+sensitive | Required. Input only. The password for the user that Databas…
    port                 = 0      # number | required | Required. The network port of the source MySQL database.
    username             = ""     # string | required | Required. The username that Database Migration Service will …
    cloud_sql_id         = ""     # string | optional | If the source is a Cloud SQL database, use this field to pro…

    # network_architecture = ""     # string | computed | Output only. If the source is a Cloud SQL database, this fie…
    # password_set         = false  # bool | computed | Output only. Indicates If this connection profile password i…

    ssl { # list [0..1]
      ca_certificate     = ""     # string | required+sensitive | Required. Input only. The x509 PEM-encoded certificate of th…
      client_certificate = ""     # string | optional+sensitive | Input only. The x509 PEM-encoded certificate that will be us…
      client_key         = ""     # string | optional+sensitive | Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded pri…

      # type               = ""     # string | computed | The current connection profile state.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

