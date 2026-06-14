# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_analysis_note                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_analysis_note" "this" {

  name               = ""     # string | required | The name of the note.
  expiration_time    = ""     # string | optional | Time of expiration for this note. Leave empty if note does n…
  id                 = ""     # string | optional+computed
  long_description   = ""     # string | optional | A detailed description of the note
  project            = ""     # string | optional+computed
  related_note_names = []     # set(string) | optional | Names of other notes related to this note.
  short_description  = ""     # string | optional | A one sentence description of the note.

  # create_time        = ""     # string | computed | The time this note was created.
  # kind               = ""     # string | computed | The type of analysis this note describes
  # update_time        = ""     # string | computed | The time this note was last updated.

  attestation_authority { # list [1..1]

    hint { # list [1..1]
      human_readable_name = ""     # string | required | The human readable name of this Attestation Authority, for e…

    }

  }

  related_url { # set
    url   = ""     # string | required | Specific URL associated with the resource.
    label = ""     # string | optional | Label to describe usage of the URL

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

