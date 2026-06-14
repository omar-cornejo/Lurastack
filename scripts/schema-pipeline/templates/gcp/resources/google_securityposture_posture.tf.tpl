# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_securityposture_posture                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_securityposture_posture" "this" {

  location    = ""     # string | required | Location of the resource, eg: global.
  parent      = ""     # string | required | The parent of the resource, an organization. Format should b…
  posture_id  = ""     # string | required | Id of the posture. It is an immutable field.
  state       = ""     # string | required | State of the posture. Update to state field should not be tr…
  description = ""     # string | optional | Description of the posture.
  id          = ""     # string | optional+computed

  # create_time = ""     # string | computed | Time the Posture was created in UTC.
  # etag        = ""     # string | computed | For Resource freshness validation (https://google.aip.dev/15…
  # name        = ""     # string | computed | Name of the posture.
  # reconciling = false  # bool | computed | If set, there are currently changes in flight to the posture…
  # revision_id = ""     # string | computed | Revision_id of the posture.
  # update_time = ""     # string | computed | Time the Posture was updated in UTC.

  policy_sets { # list [1..*]
    policy_set_id = ""     # string | required | ID of the policy set.
    description   = ""     # string | optional | Description of the policy set.

    policies { # list [1..*]
      policy_id   = ""     # string | required | ID of the policy.
      description = ""     # string | optional | Description of the policy.

      compliance_standards { # list
        control  = ""     # string | optional | Mapping of security controls for the policy.
        standard = ""     # string | optional | Mapping of compliance standards for the policy.

      }

      constraint { # list [1..1]

        org_policy_constraint { # list [0..1]
          canned_constraint_id = ""     # string | required | Organization policy canned constraint Id

          policy_rules { # list [1..*]
            allow_all = false  # bool | optional | Setting this to true means that all values are allowed. This…
            deny_all  = false  # bool | optional | Setting this to true means that all values are denied. This …
            enforce   = false  # bool | optional | If 'true', then the policy is enforced. If 'false', then any…

            condition { # list [0..1]
              expression  = ""     # string | required | Textual representation of an expression in Common Expression…
              description = ""     # string | optional | Description of the expression
              location    = ""     # string | optional | String indicating the location of the expression for error r…
              title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

            }

            values { # list [0..1]
              allowed_values = []     # list(string) | optional | List of values allowed at this resource.
              denied_values  = []     # list(string) | optional | List of values denied at this resource.

            }

          }

        }

        org_policy_constraint_custom { # list [0..1]

          custom_constraint { # list [0..1]
            action_type    = ""     # string | required | The action to take if the condition is met. Possible values:…
            condition      = ""     # string | required | A CEL condition that refers to a supported service resource,…
            method_types   = []     # list(string) | required | A list of RESTful methods for which to enforce the constrain…
            name           = ""     # string | required | Immutable. The name of the custom constraint. This is unique…
            resource_types = []     # list(string) | required | Immutable. The fully qualified name of the Google Cloud REST…
            description    = ""     # string | optional | A human-friendly description of the constraint to display as…
            display_name   = ""     # string | optional | A human-friendly name for the constraint.

          }

          policy_rules { # list [1..*]
            allow_all = false  # bool | optional | Setting this to true means that all values are allowed. This…
            deny_all  = false  # bool | optional | Setting this to true means that all values are denied. This …
            enforce   = false  # bool | optional | If 'true', then the policy is enforced. If 'false', then any…

            condition { # list [0..1]
              expression  = ""     # string | required | Textual representation of an expression in Common Expression…
              description = ""     # string | optional | Description of the expression
              location    = ""     # string | optional | String indicating the location of the expression for error r…
              title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

            }

            values { # list [0..1]
              allowed_values = []     # list(string) | optional | List of values allowed at this resource.
              denied_values  = []     # list(string) | optional | List of values denied at this resource.

            }

          }

        }

        security_health_analytics_custom_module { # list [0..1]
          display_name            = ""     # string | optional | The display name of the Security Health Analytics custom mod…
          module_enablement_state = ""     # string | optional | The state of enablement for the module at its level of the r…

          # id                      = ""     # string | computed | A server generated id of custom module.

          config { # list [1..1]
            severity       = ""     # string | required | The severity to assign to findings generated by the module. …
            description    = ""     # string | optional | Text that describes the vulnerability or misconfiguration th…
            recommendation = ""     # string | optional | An explanation of the recommended steps that security teams …

            custom_output { # list [0..1]

              properties { # list
                name = ""     # string | required | Name of the property for the custom output.

                value_expression { # list [0..1]
                  expression  = ""     # string | required | Textual representation of an expression in Common Expression…
                  description = ""     # string | optional | Description of the expression
                  location    = ""     # string | optional | String indicating the location of the expression for error r…
                  title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

                }

              }

            }

            predicate { # list [1..1]
              expression  = ""     # string | required | Textual representation of an expression in Common Expression…
              description = ""     # string | optional | Description of the expression
              location    = ""     # string | optional | String indicating the location of the expression for error r…
              title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

            }

            resource_selector { # list [1..1]
              resource_types = []     # list(string) | required | The resource types to run the detector on.

            }

          }

        }

        security_health_analytics_module { # list [0..1]
          module_name             = ""     # string | required | The name of the module eg: BIGQUERY_TABLE_CMEK_DISABLED.
          module_enablement_state = ""     # string | optional | The state of enablement for the module at its level of the r…

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

