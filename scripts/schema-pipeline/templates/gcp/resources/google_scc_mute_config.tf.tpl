# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_scc_mute_config                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_scc_mute_config" "this" {

  filter             = ""     # string | required | An expression that defines the filter to apply across create…
  mute_config_id     = ""     # string | required | Unique identifier provided by the client within the parent s…
  parent             = ""     # string | required | Resource name of the new mute configs's parent. Its format i…
  description        = ""     # string | optional | A description of the mute config.
  id                 = ""     # string | optional+computed

  # create_time        = ""     # string | computed | The time at which the mute config was created. This field is…
  # most_recent_editor = ""     # string | computed | Email address of the user who last edited the mute config. T…
  # name               = ""     # string | computed | Name of the mute config. Its format is organizations/{organi…
  # update_time        = ""     # string | computed | Output only. The most recent time at which the mute config w…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

