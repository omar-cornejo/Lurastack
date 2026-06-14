# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_artifact_registry_repository                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_artifact_registry_repository" "this" {

  format                 = ""     # string | required | The format of packages that are stored in the repository. Su…
  repository_id          = ""     # string | required | The last part of the repository name, for example: "repo1"
  cleanup_policy_dry_run = false  # bool | optional | If true, the cleanup pipeline is prevented from deleting ver…
  description            = ""     # string | optional | The user-provided description of the repository.
  id                     = ""     # string | optional+computed
  kms_key_name           = ""     # string | optional | The Cloud KMS resource name of the customer managed encrypti…
  labels                 = {}     # map(string) | optional | Labels with user-defined metadata. This field may contain up…
  location               = ""     # string | optional+computed | The name of the location this repository is located in.
  mode                   = ""     # string | optional | The mode configures the repository to serve artifacts from d…
  project                = ""     # string | optional+computed

  # create_time            = ""     # string | computed | The time when the repository was created.
  # effective_labels       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                   = ""     # string | computed | The name of the repository, for example: "repo1"
  # terraform_labels       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time            = ""     # string | computed | The time when the repository was last updated.

  cleanup_policies { # set
    id     = ""     # string | required
    action = ""     # string | optional | Policy action. Possible values: ["DELETE", "KEEP"]

    condition { # list [0..1]
      newer_than            = ""     # string | optional | Match versions newer than a duration.
      older_than            = ""     # string | optional | Match versions older than a duration.
      package_name_prefixes = []     # list(string) | optional | Match versions by package prefix. Applied on any prefix matc…
      tag_prefixes          = []     # list(string) | optional | Match versions by tag prefix. Applied on any prefix match.
      tag_state             = ""     # string | optional | Match versions by tag status. Default value: "ANY" Possible …
      version_name_prefixes = []     # list(string) | optional | Match versions by version name prefix. Applied on any prefix…

    }

    most_recent_versions { # list [0..1]
      keep_count            = 0      # number | optional | Minimum number of versions to keep.
      package_name_prefixes = []     # list(string) | optional | Match versions by package prefix. Applied on any prefix matc…

    }

  }

  docker_config { # list [0..1]
    immutable_tags = false  # bool | optional | The repository which enabled this flag prevents all tags fro…

  }

  maven_config { # list [0..1]
    allow_snapshot_overwrites = false  # bool | optional | The repository with this flag will allow publishing the same…
    version_policy            = ""     # string | optional | Version policy defines the versions that the registry will a…

  }

  remote_repository_config { # list [0..1]
    description                 = ""     # string | optional | The description of the remote source.
    disable_upstream_validation = false  # bool | optional | If true, the remote repository upstream and upstream credent…

    apt_repository { # list [0..1]

      public_repository { # list [0..1]
        repository_base = ""     # string | required | A common public repository base for Apt, e.g. '"debian/dists…
        repository_path = ""     # string | required | Specific repository from the base.

      }

    }

    docker_repository { # list [0..1]
      public_repository = ""     # string | optional | Address of the remote repository. Default value: "DOCKER_HUB…

      custom_repository { # list [0..1]
        uri = ""     # string | optional | Specific uri to the registry, e.g. '"https://registry-1.dock…

      }

    }

    maven_repository { # list [0..1]
      public_repository = ""     # string | optional | Address of the remote repository. Default value: "MAVEN_CENT…

      custom_repository { # list [0..1]
        uri = ""     # string | optional | Specific uri to the registry, e.g. '"https://repo.maven.apac…

      }

    }

    npm_repository { # list [0..1]
      public_repository = ""     # string | optional | Address of the remote repository. Default value: "NPMJS" Pos…

      custom_repository { # list [0..1]
        uri = ""     # string | optional | Specific uri to the registry, e.g. '"https://registry.npmjs.…

      }

    }

    python_repository { # list [0..1]
      public_repository = ""     # string | optional | Address of the remote repository. Default value: "PYPI" Poss…

      custom_repository { # list [0..1]
        uri = ""     # string | optional | Specific uri to the registry, e.g. '"https://pypi.io"'

      }

    }

    upstream_credentials { # list [0..1]

      username_password_credentials { # list [0..1]
        password_secret_version = ""     # string | optional | The Secret Manager key version that holds the password to ac…
        username                = ""     # string | optional | The username to access the remote repository.

      }

    }

    yum_repository { # list [0..1]

      public_repository { # list [0..1]
        repository_base = ""     # string | required | A common public repository base for Yum. Possible values: ["…
        repository_path = ""     # string | required | Specific repository from the base, e.g. '"pub/rocky/9/BaseOS…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  virtual_repository_config { # list [0..1]

    upstream_policies { # list
      id         = ""     # string | optional | The user-provided ID of the upstream policy.
      priority   = 0      # number | optional | Entries with a greater priority value take precedence in the…
      repository = ""     # string | optional | A reference to the repository resource, for example: "projec…

    }

  }

}

