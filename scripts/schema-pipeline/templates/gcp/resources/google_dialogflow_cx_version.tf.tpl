# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_version                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_version" "this" {

  display_name = ""     # string | required | The human-readable name of the version. Limit of 64 characte…
  description  = ""     # string | optional | The description of the version. The maximum length is 500 ch…
  id           = ""     # string | optional+computed
  parent       = ""     # string | optional | The Flow to create an Version for. Format: projects/<Project…

  # create_time  = ""     # string | computed | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…
  # name         = ""     # string | computed | Format: projects//locations//agents//flows//versions/. Versi…
  # nlu_settings = [  # list(object)
  #   {
  #     classification_threshold = 0
  #     model_training_mode = ""
  #     model_type = ""
  #   }
  # ]
  # state        = ""     # string | computed | The state of this version. * RUNNING: Version is not ready t…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

