# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_classification_job                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_classification_job" "this" {

  job_type                   = ""     # string | required
  custom_data_identifier_ids = []     # list(string) | optional+computed
  description                = ""     # string | optional+computed
  id                         = ""     # string | optional+computed
  initial_run                = false  # bool | optional
  job_status                 = ""     # string | optional+computed
  name                       = ""     # string | optional+computed
  name_prefix                = ""     # string | optional+computed
  sampling_percentage        = 0      # number | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # created_at                 = ""     # string | computed
  # job_arn                    = ""     # string | computed
  # job_id                     = ""     # string | computed
  # user_paused_details = [  # list(object)
  #   {
  #     job_expires_at = ""
  #     job_imminent_expiration_health_event_arn = ""
  #     job_paused_at = ""
  #   }
  # ]

  s3_job_definition { # list [1..1]

    bucket_criteria { # list [0..1]

      excludes { # list [0..1]

        and { # list

          simple_criterion { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            values     = []     # list(string) | optional+computed

          }

          tag_criterion { # list [0..1]
            comparator = ""     # string | optional+computed

            tag_values { # list
              key   = ""     # string | optional+computed
              value = ""     # string | optional+computed

            }

          }

        }

      }

      includes { # list [0..1]

        and { # list

          simple_criterion { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            values     = []     # list(string) | optional+computed

          }

          tag_criterion { # list [0..1]
            comparator = ""     # string | optional+computed

            tag_values { # list
              key   = ""     # string | optional+computed
              value = ""     # string | optional+computed

            }

          }

        }

      }

    }

    bucket_definitions { # list
      account_id = ""     # string | required
      buckets    = []     # list(string) | required

    }

    scoping { # list [0..1]

      excludes { # list [0..1]

        and { # list

          simple_scope_term { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            values     = []     # list(string) | optional+computed

          }

          tag_scope_term { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            target     = ""     # string | optional+computed

            tag_values { # list
              key   = ""     # string | optional+computed
              value = ""     # string | optional+computed

            }

          }

        }

      }

      includes { # list [0..1]

        and { # list

          simple_scope_term { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            values     = []     # list(string) | optional+computed

          }

          tag_scope_term { # list [0..1]
            comparator = ""     # string | optional+computed
            key        = ""     # string | optional+computed
            target     = ""     # string | optional+computed

            tag_values { # list
              key   = ""     # string | optional+computed
              value = ""     # string | optional+computed

            }

          }

        }

      }

    }

  }

  schedule_frequency { # list [0..1]
    daily_schedule   = false  # bool | optional
    monthly_schedule = 0      # number | optional+computed
    weekly_schedule  = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

