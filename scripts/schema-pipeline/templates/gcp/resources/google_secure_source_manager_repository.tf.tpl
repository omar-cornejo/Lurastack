# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secure_source_manager_repository             │
# └──────────────────────────────────────────────────────────────┘
resource "google_secure_source_manager_repository" "this" {

  instance      = ""     # string | required | The name of the instance in which the repository is hosted.
  location      = ""     # string | required | The location for the Repository.
  repository_id = ""     # string | required | The ID for the Repository.
  description   = ""     # string | optional | Description of the repository, which cannot exceed 500 chara…
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # create_time   = ""     # string | computed | Time the repository was created in UTC.
  # name          = ""     # string | computed | The resource name for the Repository.
  # uid           = ""     # string | computed | Unique identifier of the repository.
  # update_time   = ""     # string | computed | Time the repository was updated in UTC.
  # uris = [  # list(object)
  #   {
  #     api = ""
  #     git_https = ""
  #     html = ""
  #   }
  # ]

  initial_config { # list [0..1]
    default_branch = ""     # string | optional | Default branch name of the repository.
    gitignores     = []     # list(string) | optional | List of gitignore template names user can choose from. Valid…
    license        = ""     # string | optional | License template name user can choose from. Valid values can…
    readme         = ""     # string | optional | README template name. Valid values can be viewed at https://…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

