# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_packet_mirroring                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_packet_mirroring" "this" {

  name        = ""     # string | required | The name of the packet mirroring rule
  description = ""     # string | optional | A human-readable description of the rule.
  id          = ""     # string | optional+computed
  priority    = 0      # number | optional+computed | Since only one rule can be active at a time, priority is use…
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed | The Region in which the created address should reside. If it…

  collector_ilb { # list [1..1]
    url = ""     # string | required | The URL of the forwarding rule.

  }

  filter { # list [0..1]
    cidr_ranges  = []     # list(string) | optional | IP CIDR ranges that apply as a filter on the source (ingress…
    direction    = ""     # string | optional | Direction of traffic to mirror. Default value: "BOTH" Possib…
    ip_protocols = []     # list(string) | optional | Possible IP protocols including tcp, udp, icmp and esp

  }

  mirrored_resources { # list [1..1]
    tags = []     # list(string) | optional | All instances with these tags will be mirrored.

    instances { # list
      url = ""     # string | required | The URL of the instances where this rule should be active.

    }

    subnetworks { # list
      url = ""     # string | required | The URL of the subnetwork where this rule should be active.

    }

  }

  network { # list [1..1]
    url = ""     # string | required | The full self_link URL of the network where this rule is act…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

