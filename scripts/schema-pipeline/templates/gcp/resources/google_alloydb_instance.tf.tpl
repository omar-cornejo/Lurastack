# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_alloydb_instance                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_alloydb_instance" "this" {

  cluster               = ""     # string | required | Identifies the alloydb cluster. Must be in the format 'proje…
  instance_id           = ""     # string | required | The ID of the alloydb instance.
  instance_type         = ""     # string | required | The type of the instance. If the instance type is READ_POOL,…
  annotations           = {}     # map(string) | optional | Annotations to allow client tools to store small amount of a…
  availability_type     = ""     # string | optional+computed | 'Availability type of an Instance. Defaults to REGIONAL for …
  database_flags        = {}     # map(string) | optional+computed | Database flags. Set at instance level. * They are copied fro…
  display_name          = ""     # string | optional | User-settable and human-readable display name for the Instan…
  gce_zone              = ""     # string | optional | The Compute Engine zone that the instance should serve from,…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | User-defined labels for the alloydb instance.  **Note**: Thi…

  # create_time           = ""     # string | computed | Time the Instance was created in UTC.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # ip_address            = ""     # string | computed | The IP address for the Instance. This is the connection endp…
  # name                  = ""     # string | computed | The name of the instance resource.
  # public_ip_address     = ""     # string | computed | The public IP addresses for the Instance. This is available …
  # reconciling           = false  # bool | computed | Set to true if the current state of Instance does not match …
  # state                 = ""     # string | computed | The current state of the alloydb instance.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | The system-generated UID of the resource.
  # update_time           = ""     # string | computed | Time the Instance was updated in UTC.

  client_connection_config { # list [0..1]
    require_connectors = false  # bool | optional | Configuration to enforce connectors only (ex: AuthProxy) con…

    ssl_config { # list [0..1]
      ssl_mode = ""     # string | optional+computed | SSL mode. Specifies client-server SSL/TLS connection behavio…

    }

  }

  machine_config { # list [0..1]
    cpu_count = 0      # number | optional+computed | The number of CPU's in the VM instance.

  }

  network_config { # list [0..1]
    enable_public_ip = false  # bool | optional | Enabling public ip for the instance. If a user wishes to dis…

    authorized_external_networks { # list
      cidr_range = ""     # string | optional | CIDR range for one authorized network of the instance.

    }

  }

  psc_instance_config { # list [0..1]
    allowed_consumer_projects = []     # list(string) | optional | List of consumer projects that are allowed to create PSC end…

    # psc_dns_name              = ""     # string | computed | The DNS name of the instance for PSC connectivity. Name conv…
    # service_attachment_link   = ""     # string | computed | The service attachment created when Private Service Connect …

  }

  query_insights_config { # list [0..1]
    query_plans_per_minute  = 0      # number | optional | Number of query execution plans captured by Insights per min…
    query_string_length     = 0      # number | optional | Query string length. The default value is 1024. Any integer …
    record_application_tags = false  # bool | optional | Record application tags for an instance. This flag is turned…
    record_client_address   = false  # bool | optional | Record client address for an instance. Client address is PII…

  }

  read_pool_config { # list [0..1]
    node_count = 0      # number | optional | Read capacity, i.e. number of nodes in a read pool instance.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

