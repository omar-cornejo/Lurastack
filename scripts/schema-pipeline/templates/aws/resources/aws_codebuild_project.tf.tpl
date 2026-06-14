# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codebuild_project                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codebuild_project" "this" {

  name                   = ""     # string | required
  service_role           = ""     # string | required
  badge_enabled          = false  # bool | optional
  build_timeout          = 0      # number | optional
  concurrent_build_limit = 0      # number | optional
  description            = ""     # string | optional+computed
  encryption_key         = ""     # string | optional+computed
  id                     = ""     # string | optional+computed
  project_visibility     = ""     # string | optional
  queued_timeout         = 0      # number | optional
  resource_access_role   = ""     # string | optional
  source_version         = ""     # string | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # badge_url              = ""     # string | computed
  # public_project_alias   = ""     # string | computed

  artifacts { # list [1..1]
    type                   = ""     # string | required
    artifact_identifier    = ""     # string | optional
    bucket_owner_access    = ""     # string | optional
    encryption_disabled    = false  # bool | optional
    location               = ""     # string | optional
    name                   = ""     # string | optional
    namespace_type         = ""     # string | optional
    override_artifact_name = false  # bool | optional
    packaging              = ""     # string | optional
    path                   = ""     # string | optional

  }

  build_batch_config { # list [0..1]
    service_role      = ""     # string | required
    combine_artifacts = false  # bool | optional
    timeout_in_mins   = 0      # number | optional

    restrictions { # list [0..1]
      compute_types_allowed  = []     # list(string) | optional
      maximum_builds_allowed = 0      # number | optional

    }

  }

  cache { # list [0..1]
    location = ""     # string | optional
    modes    = []     # list(string) | optional
    type     = ""     # string | optional

  }

  environment { # list [1..1]
    compute_type                = ""     # string | required
    image                       = ""     # string | required
    type                        = ""     # string | required
    certificate                 = ""     # string | optional
    image_pull_credentials_type = ""     # string | optional
    privileged_mode             = false  # bool | optional

    environment_variable { # list
      name  = ""     # string | required
      value = ""     # string | required
      type  = ""     # string | optional

    }

    fleet { # list [0..1]
      fleet_arn = ""     # string | optional

    }

    registry_credential { # list [0..1]
      credential          = ""     # string | required
      credential_provider = ""     # string | required

    }

  }

  file_system_locations { # set
    identifier    = ""     # string | optional
    location      = ""     # string | optional
    mount_options = ""     # string | optional
    mount_point   = ""     # string | optional
    type          = ""     # string | optional

  }

  logs_config { # list [0..1]

    cloudwatch_logs { # list [0..1]
      group_name  = ""     # string | optional
      status      = ""     # string | optional
      stream_name = ""     # string | optional

    }

    s3_logs { # list [0..1]
      bucket_owner_access = ""     # string | optional
      encryption_disabled = false  # bool | optional
      location            = ""     # string | optional
      status              = ""     # string | optional

    }

  }

  secondary_artifacts { # set [0..12]
    artifact_identifier    = ""     # string | required
    type                   = ""     # string | required
    bucket_owner_access    = ""     # string | optional
    encryption_disabled    = false  # bool | optional
    location               = ""     # string | optional
    name                   = ""     # string | optional
    namespace_type         = ""     # string | optional
    override_artifact_name = false  # bool | optional
    packaging              = ""     # string | optional
    path                   = ""     # string | optional

  }

  secondary_source_version { # set [0..12]
    source_identifier = ""     # string | required
    source_version    = ""     # string | required

  }

  secondary_sources { # set [0..12]
    source_identifier   = ""     # string | required
    type                = ""     # string | required
    buildspec           = ""     # string | optional
    git_clone_depth     = 0      # number | optional
    insecure_ssl        = false  # bool | optional
    location            = ""     # string | optional
    report_build_status = false  # bool | optional

    auth { # list [0..1]
      resource = ""     # string | required
      type     = ""     # string | required

    }

    build_status_config { # list [0..1]
      context    = ""     # string | optional
      target_url = ""     # string | optional

    }

    git_submodules_config { # list [0..1]
      fetch_submodules = false  # bool | required

    }

  }

  source { # list [1..1]
    type                = ""     # string | required
    buildspec           = ""     # string | optional
    git_clone_depth     = 0      # number | optional
    insecure_ssl        = false  # bool | optional
    location            = ""     # string | optional
    report_build_status = false  # bool | optional

    auth { # list [0..1]
      resource = ""     # string | required
      type     = ""     # string | required

    }

    build_status_config { # list [0..1]
      context    = ""     # string | optional
      target_url = ""     # string | optional

    }

    git_submodules_config { # list [0..1]
      fetch_submodules = false  # bool | required

    }

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnets            = []     # set(string) | required
    vpc_id             = ""     # string | required

  }

}

