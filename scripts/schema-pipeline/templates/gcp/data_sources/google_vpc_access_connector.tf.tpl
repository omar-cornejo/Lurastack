# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vpc_access_connector                             │
# └──────────────────────────────────────────────────────────────┘
data "google_vpc_access_connector" "this" {

  name               = ""     # string | required | The name of the resource (Max 25 characters).
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional
  region             = ""     # string | optional | Region where the VPC Access connector resides. If it is not …

  # connected_projects = []     # list(string) | computed | List of projects using the connector.
  # ip_cidr_range      = ""     # string | computed | The range of internal addresses that follows RFC 4632 notati…
  # machine_type       = ""     # string | computed | Machine type of VM Instance underlying connector. Default is…
  # max_instances      = 0      # number | computed | Maximum value of instances in autoscaling group underlying t…
  # max_throughput     = 0      # number | computed | Maximum throughput of the connector in Mbps, must be greater…
  # min_instances      = 0      # number | computed | Minimum value of instances in autoscaling group underlying t…
  # min_throughput     = 0      # number | computed | Minimum throughput of the connector in Mbps. Default and min…
  # network            = ""     # string | computed | Name or self_link of the VPC network. Required if 'ip_cidr_r…
  # self_link          = ""     # string | computed | The fully qualified name of this VPC connector
  # state              = ""     # string | computed | State of the VPC access connector.
  # subnet = [  # list(object)
  #   {
  #     name = ""
  #     project_id = ""
  #   }
  # ]

}

