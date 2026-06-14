# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_event_threat_detection_custom_module     │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_event_threat_detection_custom_module" "this" {

  config           = ""     # string | required | Config for the module. For the resident module, its config v…
  enablement_state = ""     # string | required | The state of enablement for the module at the given level of…
  organization     = ""     # string | required | Numerical ID of the parent organization.
  type             = ""     # string | required | Immutable. Type for the module. e.g. CONFIGURABLE_BAD_IP.
  display_name     = ""     # string | optional | The human readable name to be displayed for the module.
  id               = ""     # string | optional+computed

  # last_editor      = ""     # string | computed | The editor that last updated the custom module
  # name             = ""     # string | computed | The resource name of the Event Threat Detection custom modul…
  # update_time      = ""     # string | computed | The time at which the custom module was last updated.  A tim…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

