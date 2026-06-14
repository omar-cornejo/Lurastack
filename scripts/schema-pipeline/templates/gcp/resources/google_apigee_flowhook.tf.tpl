# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_flowhook                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_flowhook" "this" {

  environment       = ""     # string | required | The resource ID of the environment.
  flow_hook_point   = ""     # string | required | Where in the API call flow the flow hook is invoked. Must be…
  org_id            = ""     # string | required | The Apigee Organization associated with the environment
  sharedflow        = ""     # string | required | Id of the Sharedflow attaching to a flowhook point.
  continue_on_error = false  # bool | optional | Flag that specifies whether execution should continue if the…
  description       = ""     # string | optional | Description of the flow hook.
  id                = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

