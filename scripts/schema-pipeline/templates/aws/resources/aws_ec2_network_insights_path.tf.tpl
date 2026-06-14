# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_network_insights_path                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_network_insights_path" "this" {

  protocol         = ""     # string | required
  source           = ""     # string | required
  destination      = ""     # string | optional
  destination_ip   = ""     # string | optional
  destination_port = 0      # number | optional
  id               = ""     # string | optional+computed
  source_ip        = ""     # string | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # destination_arn  = ""     # string | computed
  # source_arn       = ""     # string | computed

  filter_at_destination { # list [0..1]
    destination_address = ""     # string | optional
    source_address      = ""     # string | optional

    destination_port_range { # list [0..1]
      from_port = 0      # number | optional
      to_port   = 0      # number | optional

    }

    source_port_range { # list [0..1]
      from_port = 0      # number | optional
      to_port   = 0      # number | optional

    }

  }

  filter_at_source { # list [0..1]
    destination_address = ""     # string | optional
    source_address      = ""     # string | optional

    destination_port_range { # list [0..1]
      from_port = 0      # number | optional
      to_port   = 0      # number | optional

    }

    source_port_range { # list [0..1]
      from_port = 0      # number | optional
      to_port   = 0      # number | optional

    }

  }

}

