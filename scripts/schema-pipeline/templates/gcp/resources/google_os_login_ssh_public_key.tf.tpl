# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_os_login_ssh_public_key                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_os_login_ssh_public_key" "this" {

  key                  = ""     # string | required | Public key text in SSH format, defined by RFC4253 section 6.…
  user                 = ""     # string | required | The user email.
  expiration_time_usec = ""     # string | optional | An expiration time in microseconds since epoch.
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional | The project ID of the Google Cloud Platform project.

  # fingerprint          = ""     # string | computed | The SHA-256 fingerprint of the SSH public key.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

