# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_managed_zone                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_managed_zone" "this" {

  dns_name         = ""     # string | required | The DNS name of this managed zone, for instance "example.com…
  name             = ""     # string | required | User assigned name for this resource. Must be unique within …
  description      = ""     # string | optional | A textual description field. Defaults to 'Managed by Terrafo…
  force_destroy    = false  # bool | optional | Set this true to delete all records in the zone.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | A set of key/value label pairs to assign to this ManagedZone…
  project          = ""     # string | optional+computed
  visibility       = ""     # string | optional | The zone's visibility: public zones are exposed to the Inter…

  # creation_time    = ""     # string | computed | The time that this resource was created on the server. This …
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # managed_zone_id  = 0      # number | computed | Unique identifier for the resource; defined by the server.
  # name_servers     = []     # list(string) | computed | Delegate your managed_zone to these virtual name servers; de…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  cloud_logging_config { # list [0..1]
    enable_logging = false  # bool | required | If set, enable query logging for this ManagedZone. False by …

  }

  dnssec_config { # list [0..1]
    kind          = ""     # string | optional | Identifies what kind of resource this is
    non_existence = ""     # string | optional+computed | Specifies the mechanism used to provide authenticated denial…
    state         = ""     # string | optional | Specifies whether DNSSEC is enabled, and what mode it is in …

    default_key_specs { # list
      algorithm  = ""     # string | optional | String mnemonic specifying the DNSSEC algorithm of this key …
      key_length = 0      # number | optional | Length of the keys in bits
      key_type   = ""     # string | optional | Specifies whether this is a key signing key (KSK) or a zone …
      kind       = ""     # string | optional | Identifies what kind of resource this is

    }

  }

  forwarding_config { # list [0..1]

    target_name_servers { # set [1..*]
      ipv4_address    = ""     # string | required | IPv4 address of a target name server.
      forwarding_path = ""     # string | optional | Forwarding path for this TargetNameServer. If unset or 'defa…

    }

  }

  peering_config { # list [0..1]

    target_network { # list [1..1]
      network_url = ""     # string | required | The id or fully qualified URL of the VPC network to forward …

    }

  }

  private_visibility_config { # list [0..1]

    gke_clusters { # list
      gke_cluster_name = ""     # string | required | The resource name of the cluster to bind this ManagedZone to…

    }

    networks { # set
      network_url = ""     # string | required | The id or fully qualified URL of the VPC network to bind to.…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

