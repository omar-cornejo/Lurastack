# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firebaserules_ruleset                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_firebaserules_ruleset" "this" {

  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed | The project for the resource

  # create_time = ""     # string | computed | Output only. Time the `Ruleset` was created.
  # metadata = [  # list(object)
  #   {
  #     services = []  # list(string)
  #   }
  # ]
  # name        = ""     # string | computed | Output only. Name of the `Ruleset`. The ruleset_id is auto g…

  source { # list [1..1]
    language = ""     # string | optional | `Language` of the `Source` bundle. If unspecified, the langu…

    files { # list [1..*]
      content     = ""     # string | required | Textual Content.
      name        = ""     # string | required | File name.
      fingerprint = ""     # string | optional | Fingerprint (e.g. github sha) associated with the `File`.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

