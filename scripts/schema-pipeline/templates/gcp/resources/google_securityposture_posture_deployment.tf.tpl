# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_securityposture_posture_deployment           │
# └──────────────────────────────────────────────────────────────┘
resource "google_securityposture_posture_deployment" "this" {

  location                    = ""     # string | required | The location of the resource, eg. global'.
  parent                      = ""     # string | required | The parent of the resource, an organization. Format should b…
  posture_deployment_id       = ""     # string | required | ID of the posture deployment.
  posture_id                  = ""     # string | required | Relative name of the posture which needs to be deployed. It …
  posture_revision_id         = ""     # string | required | Revision_id the posture which needs to be deployed.
  target_resource             = ""     # string | required | The resource on which the posture should be deployed. This c…
  description                 = ""     # string | optional | Description of the posture deployment.
  id                          = ""     # string | optional+computed

  # create_time                 = ""     # string | computed | Time the posture deployment was created in UTC.
  # desired_posture_id          = ""     # string | computed | This is an output only optional field which will be filled i…
  # desired_posture_revision_id = ""     # string | computed | This is an output only optional field which will be filled i…
  # etag                        = ""     # string | computed | For Resource freshness validation (https://google.aip.dev/15…
  # failure_message             = ""     # string | computed | This is a output only optional field which will be filled in…
  # name                        = ""     # string | computed | Name of the posture deployment instance.
  # reconciling                 = false  # bool | computed | If set, there are currently changes in flight to the posture…
  # state                       = ""     # string | computed | State of the posture deployment. A posture deployment can be…
  # update_time                 = ""     # string | computed | Time the posture deployment was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

