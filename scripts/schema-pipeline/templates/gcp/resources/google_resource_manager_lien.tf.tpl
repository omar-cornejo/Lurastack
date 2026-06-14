# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_resource_manager_lien                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_resource_manager_lien" "this" {

  origin       = ""     # string | required | A stable, user-visible/meaningful string identifying the ori…
  parent       = ""     # string | required | A reference to the resource this Lien is attached to. The se…
  reason       = ""     # string | required | Concise user-visible strings indicating why an action cannot…
  restrictions = []     # list(string) | required | The types of operations which should be blocked as a result …
  id           = ""     # string | optional+computed

  # create_time  = ""     # string | computed | Time of creation
  # name         = ""     # string | computed | A system-generated unique identifier for this Lien.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

