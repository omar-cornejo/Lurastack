# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_workload_identity_pool                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_workload_identity_pool" "this" {

  workload_identity_pool_id = ""     # string | required | The ID to use for the pool, which becomes the final componen…
  description               = ""     # string | optional | A description of the pool. Cannot exceed 256 characters.
  disabled                  = false  # bool | optional | Whether the pool is disabled. You cannot use a disabled pool…
  display_name              = ""     # string | optional | A display name for the pool. Cannot exceed 32 characters.
  id                        = ""     # string | optional+computed
  project                   = ""     # string | optional+computed

  # name                      = ""     # string | computed | The resource name of the pool as 'projects/{project_number}/…
  # state                     = ""     # string | computed | The state of the pool. * STATE_UNSPECIFIED: State unspecifie…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

