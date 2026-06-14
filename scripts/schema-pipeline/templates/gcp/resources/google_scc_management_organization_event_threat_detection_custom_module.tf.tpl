# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_management_organization_event_threat_detection_custom_module  │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_management_organization_event_threat_detection_custom_module" "this" {

  organization     = ""     # string | required | Numerical ID of the parent organization.
  config           = ""     # string | optional | Config for the module. For the resident module, its config v…
  display_name     = ""     # string | optional | The human readable name to be displayed for the module.
  enablement_state = ""     # string | optional | The state of enablement for the module at the given level of…
  id               = ""     # string | optional+computed
  location         = ""     # string | optional | Location ID of the parent organization. Only global is suppo…
  type             = ""     # string | optional | Immutable. Type for the module. e.g. CONFIGURABLE_BAD_IP.

  # last_editor      = ""     # string | computed | The editor that last updated the custom module
  # name             = ""     # string | computed | The resource name of the Event Threat Detection custom modul…
  # update_time      = ""     # string | computed | The time at which the custom module was last updated.  A tim…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

