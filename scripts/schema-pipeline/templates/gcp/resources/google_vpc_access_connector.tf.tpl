# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vpc_access_connector                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_vpc_access_connector" "this" {

  name               = ""     # string | required | The name of the resource (Max 25 characters).
  id                 = ""     # string | optional+computed
  ip_cidr_range      = ""     # string | optional | The range of internal addresses that follows RFC 4632 notati…
  machine_type       = ""     # string | optional | Machine type of VM Instance underlying connector. Default is…
  max_instances      = 0      # number | optional+computed | Maximum value of instances in autoscaling group underlying t…
  max_throughput     = 0      # number | optional | Maximum throughput of the connector in Mbps, must be greater…
  min_instances      = 0      # number | optional+computed | Minimum value of instances in autoscaling group underlying t…
  min_throughput     = 0      # number | optional | Minimum throughput of the connector in Mbps. Default and min…
  network            = ""     # string | optional+computed | Name or self_link of the VPC network. Required if 'ip_cidr_r…
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | Region where the VPC Access connector resides. If it is not …

  # connected_projects = []     # list(string) | computed | List of projects using the connector.
  # self_link          = ""     # string | computed | The fully qualified name of this VPC connector
  # state              = ""     # string | computed | State of the VPC access connector.

  subnet { # list [0..1]
    name       = ""     # string | optional | Subnet name (relative, not fully qualified). E.g. if the ful…
    project_id = ""     # string | optional+computed | Project in which the subnet exists. If not set, this project…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

