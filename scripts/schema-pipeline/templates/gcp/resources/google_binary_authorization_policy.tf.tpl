# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_binary_authorization_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_binary_authorization_policy" "this" {

  description                   = ""     # string | optional | A descriptive comment.
  global_policy_evaluation_mode = ""     # string | optional+computed | Controls the evaluation of a Google-maintained global admiss…
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional+computed

  admission_whitelist_patterns { # list
    name_pattern = ""     # string | required | An image name pattern to whitelist, in the form 'registry/pa…

  }

  cluster_admission_rules { # set
    cluster                 = ""     # string | required
    enforcement_mode        = ""     # string | required | The action when a pod creation is denied by the admission ru…
    evaluation_mode         = ""     # string | required | How this admission rule will be evaluated. Possible values: …
    require_attestations_by = []     # set(string) | optional | The resource names of the attestors that must attest to a co…

  }

  default_admission_rule { # list [1..1]
    enforcement_mode        = ""     # string | required | The action when a pod creation is denied by the admission ru…
    evaluation_mode         = ""     # string | required | How this admission rule will be evaluated. Possible values: …
    require_attestations_by = []     # set(string) | optional | The resource names of the attestors that must attest to a co…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

