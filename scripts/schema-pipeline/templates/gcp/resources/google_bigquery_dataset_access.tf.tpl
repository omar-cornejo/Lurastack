# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_dataset_access                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_dataset_access" "this" {

  dataset_id         = ""     # string | required | A unique ID for this dataset, without the project name. The …
  domain             = ""     # string | optional | A domain to grant access to. Any users signed in with the do…
  group_by_email     = ""     # string | optional | An email address of a Google Group to grant access to.
  iam_member         = ""     # string | optional | Some other type of member that appears in the IAM Policy but…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  role               = ""     # string | optional | Describes the rights granted to the user specified by the ot…
  special_group      = ""     # string | optional | A special group to grant access to. Possible values include:…
  user_by_email      = ""     # string | optional | An email address of a user to grant access to. For example: …

  # api_updated_member = false  # bool | computed | If true, represents that that the iam_member in the config w…

  dataset { # list [0..1]
    target_types = []     # list(string) | required | Which resources in the dataset this entry applies to. Curren…

    dataset { # list [1..1]
      dataset_id = ""     # string | required | The ID of the dataset containing this table.
      project_id = ""     # string | required | The ID of the project containing this table.

    }

  }

  routine { # list [0..1]
    dataset_id = ""     # string | required | The ID of the dataset containing this table.
    project_id = ""     # string | required | The ID of the project containing this table.
    routine_id = ""     # string | required | The ID of the routine. The ID must contain only letters (a-z…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

  view { # list [0..1]
    dataset_id = ""     # string | required | The ID of the dataset containing this table.
    project_id = ""     # string | required | The ID of the project containing this table.
    table_id   = ""     # string | required | The ID of the table. The ID must contain only letters (a-z, …

  }

}

