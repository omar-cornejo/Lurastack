# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_target_pool                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_target_pool" "this" {

  name             = ""     # string | required | A unique name for the resource, required by GCE. Changing th…
  backup_pool      = ""     # string | optional | URL to the backup target pool. Must also set failover_ratio.
  description      = ""     # string | optional | Textual description field.
  failover_ratio   = 0      # number | optional | Ratio (0 to 1) of failed nodes before using the backup pool …
  health_checks    = []     # list(string) | optional | List of zero or one health check name or self_link. Only leg…
  id               = ""     # string | optional+computed
  instances        = []     # set(string) | optional+computed | List of instances in the pool. They can be given as URLs, or…
  project          = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…
  region           = ""     # string | optional+computed | Where the target pool resides. Defaults to project region.
  session_affinity = ""     # string | optional | How to distribute load. Options are "NONE" (no affinity). "C…

  # self_link        = ""     # string | computed | The URI of the created resource.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

