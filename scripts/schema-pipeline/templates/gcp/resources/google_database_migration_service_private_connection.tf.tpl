# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_database_migration_service_private_connection  │
# └──────────────────────────────────────────────────────────────┘
resource "google_database_migration_service_private_connection" "this" {

  location              = ""     # string | required | The name of the location this private connection is located …
  private_connection_id = ""     # string | required | The private connectivity identifier.
  display_name          = ""     # string | optional+computed | Display name.
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Labels.  **Note**: This field is non-authoritative, and will…
  project               = ""     # string | optional+computed

  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # error = [  # list(object)
  #   {
  #     details = {}  # map(string)
  #     message = ""
  #   }
  # ]
  # name                  = ""     # string | computed | The resource's name.
  # state                 = ""     # string | computed | State of the PrivateConnection.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_peering_config { # list [1..1]
    subnet   = ""     # string | required | A free subnet for peering. (CIDR of /29)
    vpc_name = ""     # string | required | Fully qualified name of the VPC that Database Migration Serv…

  }

}

