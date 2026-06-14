# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_networkmanager_core_network_policy_document         │
# └──────────────────────────────────────────────────────────────┘
data "aws_networkmanager_core_network_policy_document" "this" {

  id      = ""     # string | optional+computed
  version = ""     # string | optional

  # json    = ""     # string | computed

  attachment_policies { # list
    rule_number     = 0      # number | required
    condition_logic = ""     # string | optional
    description     = ""     # string | optional

    action { # list [1..1]
      add_to_network_function_group = ""     # string | optional
      association_method            = ""     # string | optional
      require_acceptance            = false  # bool | optional
      segment                       = ""     # string | optional
      tag_value_of_key              = ""     # string | optional

    }

    conditions { # list [1..*]
      type     = ""     # string | required
      key      = ""     # string | optional
      operator = ""     # string | optional
      value    = ""     # string | optional

    }

  }

  core_network_configuration { # list [1..*]
    asn_ranges         = []     # set(string) | required
    inside_cidr_blocks = []     # set(string) | optional
    vpn_ecmp_support   = false  # bool | optional

    edge_locations { # list [1..*]
      location           = ""     # string | required
      asn                = ""     # string | optional
      inside_cidr_blocks = []     # list(string) | optional

    }

  }

  network_function_groups { # list
    name                          = ""     # string | required
    require_attachment_acceptance = false  # bool | required
    description                   = ""     # string | optional

  }

  segment_actions { # list
    action                  = ""     # string | required
    segment                 = ""     # string | required
    description             = ""     # string | optional
    destination_cidr_blocks = []     # set(string) | optional
    destinations            = []     # set(string) | optional
    mode                    = ""     # string | optional
    share_with              = []     # set(string) | optional
    share_with_except       = []     # set(string) | optional

    via { # list [0..1]
      network_function_groups = []     # set(string) | optional

      with_edge_override { # list
        edge_sets         = []     # set(set(string)) | optional
        use_edge          = ""     # string | optional+DEPRECATED
        use_edge_location = ""     # string | optional

      }

    }

    when_sent_to { # list [0..1]
      segments = []     # set(string) | optional

    }

  }

  segments { # list [1..*]
    name                          = ""     # string | required
    allow_filter                  = []     # set(string) | optional
    deny_filter                   = []     # set(string) | optional
    description                   = ""     # string | optional
    edge_locations                = []     # set(string) | optional
    isolate_attachments           = false  # bool | optional
    require_attachment_acceptance = false  # bool | optional

  }

}

