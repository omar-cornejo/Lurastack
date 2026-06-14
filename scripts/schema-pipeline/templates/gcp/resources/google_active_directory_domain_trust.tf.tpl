# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_active_directory_domain_trust                │
# └──────────────────────────────────────────────────────────────┘
resource "google_active_directory_domain_trust" "this" {

  domain                   = ""     # string | required | The fully qualified domain name. e.g. mydomain.myorganizatio…
  target_dns_ip_addresses  = []     # set(string) | required | The target DNS server IP addresses which can resolve the rem…
  target_domain_name       = ""     # string | required | The fully qualified target domain name which will be in trus…
  trust_direction          = ""     # string | required | The trust direction, which decides if the current domain is …
  trust_handshake_secret   = ""     # string | required+sensitive | The trust secret used for the handshake with the target doma…
  trust_type               = ""     # string | required | The type of trust represented by the trust resource. Possibl…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed
  selective_authentication = false  # bool | optional | Whether the trusted side has forest/domain wide access or se…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

