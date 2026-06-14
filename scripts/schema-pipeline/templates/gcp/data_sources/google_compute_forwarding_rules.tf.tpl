# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_forwarding_rules                         │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_forwarding_rules" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional
  region  = ""     # string | optional

  # rules = [  # list(object)
  #   {
  #     all_ports = false
  #     allow_global_access = false
  #     allow_psc_global_access = false
  #     backend_service = ""
  #     base_forwarding_rule = ""
  #     creation_timestamp = ""
  #     description = ""
  #     effective_labels = {}  # map(string)
  #     forwarding_rule_id = 0
  #     ip_address = ""
  #     ip_protocol = ""
  #     ip_version = ""
  #     is_mirroring_collector = false
  #     label_fingerprint = ""
  #     labels = {}  # map(string)
  #     load_balancing_scheme = ""
  #     name = ""
  #     network = ""
  #     network_tier = ""
  #     no_automate_dns_zone = false
  #     port_range = ""
  #     ports = []  # set(string)
  #     project = ""
  #     psc_connection_id = ""
  #     psc_connection_status = ""
  #     recreate_closed_psc = false
  #     region = ""
  #     self_link = ""
  #     service_directory_registrations = [  # list(object)
  #       {
  #         namespace = ""
  #         service = ""
  #       }
  #     ]
  #     service_label = ""
  #     service_name = ""
  #     source_ip_ranges = []  # list(string)
  #     subnetwork = ""
  #     target = ""
  #     terraform_labels = {}  # map(string)
  #   }
  # ]

}

