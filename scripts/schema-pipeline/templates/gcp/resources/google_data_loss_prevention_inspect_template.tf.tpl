# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_loss_prevention_inspect_template        │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_loss_prevention_inspect_template" "this" {

  parent       = ""     # string | required | The parent of the inspect template in any of the following f…
  description  = ""     # string | optional | A description of the inspect template.
  display_name = ""     # string | optional | User set display name of the inspect template.
  id           = ""     # string | optional+computed
  template_id  = ""     # string | optional+computed | The template id can contain uppercase and lowercase letters,…

  # name         = ""     # string | computed | The resource name of the inspect template. Set by the server…

  inspect_config { # list [0..1]
    content_options    = []     # list(string) | optional | List of options defining data content to scan. If empty, tex…
    exclude_info_types = false  # bool | optional | When true, excludes type information of the findings.
    include_quote      = false  # bool | optional | When true, a contextual quote from the data that triggered a…
    min_likelihood     = ""     # string | optional | Only returns findings equal or above this threshold. See htt…

    custom_info_types { # list
      exclusion_type = ""     # string | optional | If set to EXCLUSION_TYPE_EXCLUDE this infoType will not caus…
      likelihood     = ""     # string | optional | Likelihood to return for this CustomInfoType. This base valu…

      dictionary { # list [0..1]

        cloud_storage_path { # list [0..1]
          path = ""     # string | required | A url representing a file or path (no wildcards) in Cloud St…

        }

        word_list { # list [0..1]
          words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

        }

      }

      info_type { # list [1..1]
        name    = ""     # string | required | Name of the information type. Either a name of your choosing…
        version = ""     # string | optional | Version name for this InfoType.

        sensitivity_score { # list [0..1]
          score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

        }

      }

      regex { # list [0..1]
        pattern       = ""     # string | required | Pattern defining the regular expression. Its syntax (https:/…
        group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…

      }

      sensitivity_score { # list [0..1]
        score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

      }

      stored_type { # list [0..1]
        name = ""     # string | required | Resource name of the requested StoredInfoType, for example '…

      }

      surrogate_type {} # list [0..1]

    }

    info_types { # list
      name    = ""     # string | required | Name of the information type. Either a name of your choosing…
      version = ""     # string | optional | Version of the information type to use. By default, the vers…

      sensitivity_score { # list [0..1]
        score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

      }

    }

    limits { # list [0..1]
      max_findings_per_item    = 0      # number | required | Max number of findings that will be returned for each item s…
      max_findings_per_request = 0      # number | required | Max number of findings that will be returned per request/job…

      max_findings_per_info_type { # list
        max_findings = 0      # number | required | Max findings limit for the given infoType.

        info_type { # list [0..1]
          name    = ""     # string | required | Name of the information type. Either a name of your choosing…
          version = ""     # string | optional | Version name for this InfoType.

          sensitivity_score { # list [0..1]
            score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

          }

        }

      }

    }

    rule_set { # list

      info_types { # list [1..*]
        name    = ""     # string | required | Name of the information type. Either a name of your choosing…
        version = ""     # string | optional | Version name for this InfoType.

        sensitivity_score { # list [0..1]
          score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

        }

      }

      rules { # list [1..*]

        exclusion_rule { # list [0..1]
          matching_type = ""     # string | required | How the rule is applied. See the documentation for more info…

          dictionary { # list [0..1]

            cloud_storage_path { # list [0..1]
              path = ""     # string | required | A url representing a file or path (no wildcards) in Cloud St…

            }

            word_list { # list [0..1]
              words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

            }

          }

          exclude_by_hotword { # list [0..1]

            hotword_regex { # list [1..1]
              pattern       = ""     # string | required | Pattern defining the regular expression. Its syntax (https:/…
              group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…

            }

            proximity { # list [1..1]
              window_after  = 0      # number | optional | Number of characters after the finding to consider.
              window_before = 0      # number | optional | Number of characters before the finding to consider.

            }

          }

          exclude_info_types { # list [0..1]

            info_types { # list [1..*]
              name    = ""     # string | required | Name of the information type. Either a name of your choosing…
              version = ""     # string | optional | Version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

          }

          regex { # list [0..1]
            pattern       = ""     # string | required | Pattern defining the regular expression. Its syntax (https:/…
            group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…

          }

        }

        hotword_rule { # list [0..1]

          hotword_regex { # list [1..1]
            pattern       = ""     # string | required | Pattern defining the regular expression. Its syntax (https:/…
            group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…

          }

          likelihood_adjustment { # list [1..1]
            fixed_likelihood    = ""     # string | optional | Set the likelihood of a finding to a fixed value. Either thi…
            relative_likelihood = 0      # number | optional | Increase or decrease the likelihood by the specified number …

          }

          proximity { # list [1..1]
            window_after  = 0      # number | optional | Number of characters after the finding to consider. Either t…
            window_before = 0      # number | optional | Number of characters before the finding to consider. Either …

          }

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

