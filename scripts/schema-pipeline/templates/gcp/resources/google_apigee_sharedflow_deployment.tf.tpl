# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_sharedflow_deployment                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_sharedflow_deployment" "this" {

  environment     = ""     # string | required | The resource ID of the environment.
  org_id          = ""     # string | required | The Apigee Organization associated with the Apigee instance
  revision        = ""     # string | required | Revision of the Sharedflow to be deployed.
  sharedflow_id   = ""     # string | required | Id of the Sharedflow to be deployed.
  id              = ""     # string | optional+computed
  service_account = ""     # string | optional | The service account represents the identity of the deployed …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

