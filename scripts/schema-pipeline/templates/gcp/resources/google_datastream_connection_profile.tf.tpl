# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_datastream_connection_profile                │
# └──────────────────────────────────────────────────────────────┘
resource "google_datastream_connection_profile" "this" {

  connection_profile_id     = ""     # string | required | The connection profile identifier.
  display_name              = ""     # string | required | Display name.
  location                  = ""     # string | required | The name of the location this connection profile is located …
  create_without_validation = false  # bool | optional | Create the connection profile without validating it.
  id                        = ""     # string | optional+computed
  labels                    = {}     # map(string) | optional | Labels.  **Note**: This field is non-authoritative, and will…
  project                   = ""     # string | optional+computed

  # effective_labels          = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                      = ""     # string | computed | The resource's name.
  # terraform_labels          = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  bigquery_profile {} # list [0..1]

  forward_ssh_connectivity { # list [0..1]
    hostname    = ""     # string | required | Hostname for the SSH tunnel.
    username    = ""     # string | required | Username for the SSH tunnel.
    password    = ""     # string | optional+sensitive | SSH password.
    port        = 0      # number | optional | Port for the SSH tunnel.
    private_key = ""     # string | optional+sensitive | SSH private key.

  }

  gcs_profile { # list [0..1]
    bucket    = ""     # string | required | The Cloud Storage bucket name.
    root_path = ""     # string | optional | The root path inside the Cloud Storage bucket.

  }

  mysql_profile { # list [0..1]
    hostname = ""     # string | required | Hostname for the MySQL connection.
    password = ""     # string | required+sensitive | Password for the MySQL connection.
    username = ""     # string | required | Username for the MySQL connection.
    port     = 0      # number | optional | Port for the MySQL connection.

    ssl_config { # list [0..1]
      ca_certificate         = ""     # string | optional+sensitive | PEM-encoded certificate of the CA that signed the source dat…
      client_certificate     = ""     # string | optional+sensitive | PEM-encoded certificate that will be used by the replica to …
      client_key             = ""     # string | optional+sensitive | PEM-encoded private key associated with the Client Certifica…

      # ca_certificate_set     = false  # bool | computed | Indicates whether the clientKey field is set.
      # client_certificate_set = false  # bool | computed | Indicates whether the clientCertificate field is set.
      # client_key_set         = false  # bool | computed | Indicates whether the clientKey field is set.

    }

  }

  oracle_profile { # list [0..1]
    database_service      = ""     # string | required | Database for the Oracle connection.
    hostname              = ""     # string | required | Hostname for the Oracle connection.
    password              = ""     # string | required+sensitive | Password for the Oracle connection.
    username              = ""     # string | required | Username for the Oracle connection.
    connection_attributes = {}     # map(string) | optional | Connection string attributes
    port                  = 0      # number | optional | Port for the Oracle connection.

  }

  postgresql_profile { # list [0..1]
    database = ""     # string | required | Database for the PostgreSQL connection.
    hostname = ""     # string | required | Hostname for the PostgreSQL connection.
    password = ""     # string | required+sensitive | Password for the PostgreSQL connection.
    username = ""     # string | required | Username for the PostgreSQL connection.
    port     = 0      # number | optional | Port for the PostgreSQL connection.

  }

  private_connectivity { # list [0..1]
    private_connection = ""     # string | required | A reference to a private connection resource. Format: 'proje…

  }

  sql_server_profile { # list [0..1]
    database = ""     # string | required | Database for the SQL Server connection.
    hostname = ""     # string | required | Hostname for the SQL Server connection.
    password = ""     # string | required+sensitive | Password for the SQL Server connection.
    username = ""     # string | required | Username for the SQL Server connection.
    port     = 0      # number | optional | Port for the SQL Server connection.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

