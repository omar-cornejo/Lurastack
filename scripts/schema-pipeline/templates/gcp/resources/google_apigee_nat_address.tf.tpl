# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_nat_address                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_nat_address" "this" {

  instance_id = ""     # string | required | The Apigee instance associated with the Apigee environment, …
  name        = ""     # string | required | Resource ID of the NAT address.
  id          = ""     # string | optional+computed

  # ip_address  = ""     # string | computed | The allocated NAT IP address.
  # state       = ""     # string | computed | State of the NAT IP address.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

