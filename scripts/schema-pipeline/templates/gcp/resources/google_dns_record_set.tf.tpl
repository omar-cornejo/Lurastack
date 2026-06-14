# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_record_set                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_record_set" "this" {

  managed_zone = ""     # string | required | The name of the zone in which this record set will reside.
  name         = ""     # string | required | The DNS name this record set will apply to.
  type         = ""     # string | required | The DNS record set type.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  rrdatas      = []     # list(string) | optional | The string data for the records in this record set whose mea…
  ttl          = 0      # number | optional | The time-to-live of this record set (seconds).

  routing_policy { # list [0..1]
    enable_geo_fencing = false  # bool | optional | Specifies whether to enable fencing for geo queries.

    geo { # list
      location = ""     # string | required | The location name defined in Google Cloud.
      rrdatas  = []     # list(string) | optional

      health_checked_targets { # list [0..1]

        internal_load_balancers { # list [1..*]
          ip_address         = ""     # string | required | The frontend IP address of the load balancer.
          ip_protocol        = ""     # string | required | The configured IP protocol of the load balancer. This value …
          network_url        = ""     # string | required | The fully qualified url of the network in which the load bal…
          port               = ""     # string | required | The configured port of the load balancer.
          project            = ""     # string | required | The ID of the project in which the load balancer belongs.
          load_balancer_type = ""     # string | optional | The type of load balancer. This value is case-sensitive. Pos…
          region             = ""     # string | optional | The region of the load balancer. Only needed for regional lo…

        }

      }

    }

    primary_backup { # list [0..1]
      enable_geo_fencing_for_backups = false  # bool | optional | Specifies whether to enable fencing for backup geo queries.
      trickle_ratio                  = 0      # number | optional | Specifies the percentage of traffic to send to the backup ta…

      backup_geo { # list [1..*]
        location = ""     # string | required | The location name defined in Google Cloud.
        rrdatas  = []     # list(string) | optional

        health_checked_targets { # list [0..1]

          internal_load_balancers { # list [1..*]
            ip_address         = ""     # string | required | The frontend IP address of the load balancer.
            ip_protocol        = ""     # string | required | The configured IP protocol of the load balancer. This value …
            network_url        = ""     # string | required | The fully qualified url of the network in which the load bal…
            port               = ""     # string | required | The configured port of the load balancer.
            project            = ""     # string | required | The ID of the project in which the load balancer belongs.
            load_balancer_type = ""     # string | optional | The type of load balancer. This value is case-sensitive. Pos…
            region             = ""     # string | optional | The region of the load balancer. Only needed for regional lo…

          }

        }

      }

      primary { # list [1..1]

        internal_load_balancers { # list [1..*]
          ip_address         = ""     # string | required | The frontend IP address of the load balancer.
          ip_protocol        = ""     # string | required | The configured IP protocol of the load balancer. This value …
          network_url        = ""     # string | required | The fully qualified url of the network in which the load bal…
          port               = ""     # string | required | The configured port of the load balancer.
          project            = ""     # string | required | The ID of the project in which the load balancer belongs.
          load_balancer_type = ""     # string | optional | The type of load balancer. This value is case-sensitive. Pos…
          region             = ""     # string | optional | The region of the load balancer. Only needed for regional lo…

        }

      }

    }

    wrr { # list
      weight  = 0      # number | required | The ratio of traffic routed to the target.
      rrdatas = []     # list(string) | optional

      health_checked_targets { # list [0..1]

        internal_load_balancers { # list [1..*]
          ip_address         = ""     # string | required | The frontend IP address of the load balancer.
          ip_protocol        = ""     # string | required | The configured IP protocol of the load balancer. This value …
          network_url        = ""     # string | required | The fully qualified url of the network in which the load bal…
          port               = ""     # string | required | The configured port of the load balancer.
          project            = ""     # string | required | The ID of the project in which the load balancer belongs.
          load_balancer_type = ""     # string | optional | The type of load balancer. This value is case-sensitive. Pos…
          region             = ""     # string | optional | The region of the load balancer. Only needed for regional lo…

        }

      }

    }

  }

}

