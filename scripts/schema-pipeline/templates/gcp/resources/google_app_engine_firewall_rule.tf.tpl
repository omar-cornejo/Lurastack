# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_firewall_rule                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_firewall_rule" "this" {

  action       = ""     # string | required | The action to take if this rule matches. Possible values: ["…
  source_range = ""     # string | required | IP address or range, defined using CIDR notation, of request…
  description  = ""     # string | optional | An optional string description of this rule.
  id           = ""     # string | optional+computed
  priority     = 0      # number | optional | A positive integer that defines the order of rule evaluation…
  project      = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

