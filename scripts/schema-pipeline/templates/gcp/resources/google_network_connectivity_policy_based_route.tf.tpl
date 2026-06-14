# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_connectivity_policy_based_route      │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_connectivity_policy_based_route" "this" {

  name                  = ""     # string | required | The name of the policy based route.
  network               = ""     # string | required | Fully-qualified URL of the network that this route applies t…
  description           = ""     # string | optional | An optional description of this resource.
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | User-defined labels.   **Note**: This field is non-authorita…
  next_hop_ilb_ip       = ""     # string | optional | The IP address of a global-access-enabled L4 ILB that is the…
  next_hop_other_routes = ""     # string | optional | Other routes that will be referenced to determine the next h…
  priority              = 0      # number | optional | The priority of this policy-based route. Priority is used to…
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Time when the policy-based route was created.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # kind                  = ""     # string | computed | Type of this resource.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time           = ""     # string | computed | Time when the policy-based route was created.
  # warnings = [  # list(object)
  #   {
  #     code = ""
  #     data = {}  # map(string)
  #     warning_message = ""
  #   }
  # ]

  filter { # list [1..1]
    protocol_version = ""     # string | required | Internet protocol versions this policy-based route applies t…
    dest_range       = ""     # string | optional | The destination IP range of outgoing packets that this polic…
    ip_protocol      = ""     # string | optional | The IP protocol that this policy-based route applies to. Val…
    src_range        = ""     # string | optional | The source IP range of outgoing packets that this policy-bas…

  }

  interconnect_attachment { # list [0..1]
    region = ""     # string | required | Cloud region to install this policy-based route on for Inter…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  virtual_machine { # list [0..1]
    tags = []     # list(string) | required | A list of VM instance tags that this policy-based route appl…

  }

}

