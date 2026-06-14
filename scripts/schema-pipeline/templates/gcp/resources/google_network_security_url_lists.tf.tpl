# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_security_url_lists                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_security_url_lists" "this" {

  location    = ""     # string | required | The location of the url lists.
  name        = ""     # string | required | Short name of the UrlList resource to be created. This value…
  values      = []     # list(string) | required | FQDNs and URLs.
  description = ""     # string | optional | Free-text description of the resource.
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # create_time = ""     # string | computed | Output only. Time when the security policy was created. A ti…
  # update_time = ""     # string | computed | Output only. Time when the security policy was updated. A ti…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

