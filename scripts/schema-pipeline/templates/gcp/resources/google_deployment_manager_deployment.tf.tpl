# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_deployment_manager_deployment                │
# └──────────────────────────────────────────────────────────────┘
resource "google_deployment_manager_deployment" "this" {

  name          = ""     # string | required | Unique name for the deployment
  create_policy = ""     # string | optional | Set the policy to use for creating new resources. Only used …
  delete_policy = ""     # string | optional | Set the policy to use for deleting new resources on update/d…
  description   = ""     # string | optional | Optional user-provided description of deployment.
  id            = ""     # string | optional+computed
  preview       = false  # bool | optional | If set to true, a deployment is created with "shell" resourc…
  project       = ""     # string | optional+computed

  # deployment_id = ""     # string | computed | Unique identifier for deployment. Output only.
  # manifest      = ""     # string | computed | Output only. URL of the manifest representing the last manif…
  # self_link     = ""     # string | computed | Output only. Server defined URL for the resource.

  labels { # set
    key   = ""     # string | optional | Key for label.
    value = ""     # string | optional | Value of label.

  }

  target { # list [1..1]

    config { # list [1..1]
      content = ""     # string | required | The full YAML contents of your configuration file.

    }

    imports { # list
      content = ""     # string | optional | The full contents of the template that you want to import.
      name    = ""     # string | optional | The name of the template to import, as declared in the YAML …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

