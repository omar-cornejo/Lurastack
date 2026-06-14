# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_response_policy_rule                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_response_policy_rule" "this" {

  dns_name        = ""     # string | required | The DNS name (wildcard or exact) to apply this rule to. Must…
  response_policy = ""     # string | required | Identifies the response policy addressed by this request.
  rule_name       = ""     # string | required | An identifier for this rule. Must be unique with the Respons…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed

  local_data { # list [0..1]

    local_datas { # list [1..*]
      name    = ""     # string | required | For example, www.example.com.
      type    = ""     # string | required | One of valid DNS resource types. Possible values: ["A", "AAA…
      rrdatas = []     # list(string) | optional | As defined in RFC 1035 (section 5) and RFC 1034 (section 3.6…
      ttl     = 0      # number | optional | Number of seconds that this ResourceRecordSet can be cached …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

