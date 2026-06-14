# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_loss_prevention_job_trigger             │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_loss_prevention_job_trigger" "this" {

  parent        = ""     # string | required | The parent of the trigger, either in the format 'projects/{{…
  description   = ""     # string | optional | A description of the job trigger.
  display_name  = ""     # string | optional | User set display name of the job trigger.
  id            = ""     # string | optional+computed
  status        = ""     # string | optional | Whether the trigger is currently active. Default value: "HEA…
  trigger_id    = ""     # string | optional+computed | The trigger id can contain uppercase and lowercase letters, …

  # create_time   = ""     # string | computed | The creation timestamp of an inspectTemplate. Set by the ser…
  # last_run_time = ""     # string | computed | The timestamp of the last time this trigger executed.
  # name          = ""     # string | computed | The resource name of the job trigger. Set by the server.
  # update_time   = ""     # string | computed | The last update timestamp of an inspectTemplate. Set by the …

  inspect_job { # list [0..1]
    inspect_template_name = ""     # string | optional | The name of the template to run when this job is triggered.

    actions { # list

      deidentify { # list [0..1]
        cloud_storage_output    = ""     # string | required | User settable Cloud Storage bucket and folders to store de-i…
        file_types_to_transform = []     # list(string) | optional | List of user-specified file type groups to transform. If spe…

        transformation_config { # list [0..1]
          deidentify_template            = ""     # string | optional | If this template is specified, it will serve as the default …
          image_redact_template          = ""     # string | optional | If this template is specified, it will serve as the de-ident…
          structured_deidentify_template = ""     # string | optional | If this template is specified, it will serve as the de-ident…

        }

        transformation_details_storage_config { # list [0..1]

          table { # list [1..1]
            dataset_id = ""     # string | required | The ID of the dataset containing this table.
            project_id = ""     # string | required | The ID of the project containing this table.
            table_id   = ""     # string | optional | The ID of the table. The ID must contain only letters (a-z, …

          }

        }

      }

      job_notification_emails {} # list [0..1]

      pub_sub { # list [0..1]
        topic = ""     # string | required | Cloud Pub/Sub topic to send notifications to.

      }

      publish_findings_to_cloud_data_catalog {} # list [0..1]

      publish_summary_to_cscc {} # list [0..1]

      publish_to_stackdriver {} # list [0..1]

      save_findings { # list [0..1]

        output_config { # list [1..1]
          output_schema = ""     # string | optional | Schema used for writing the findings for Inspect jobs. This …

          table { # list [1..1]
            dataset_id = ""     # string | required | Dataset ID of the table.
            project_id = ""     # string | required | The Google Cloud Platform project ID of the project containi…
            table_id   = ""     # string | optional | Name of the table. If is not set a new one will be generated…

          }

        }

      }

    }

    inspect_config { # list [0..1]
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
          version = ""     # string | optional | Version of the information type to use. By default, the vers…

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
          name        = ""     # string | required | Resource name of the requested StoredInfoType, for example '…

          # create_time = ""     # string | computed | The creation timestamp of an inspectTemplate. Set by the ser…

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
        max_findings_per_item    = 0      # number | optional | Max number of findings that will be returned for each item s…
        max_findings_per_request = 0      # number | optional | Max number of findings that will be returned per request/job…

        max_findings_per_info_type { # list
          max_findings = 0      # number | optional | Max findings limit for the given infoType.

          info_type { # list [0..1]
            name    = ""     # string | required | Name of the information type. Either a name of your choosing…
            version = ""     # string | optional | Version of the information type to use. By default, the vers…

            sensitivity_score { # list [0..1]
              score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

            }

          }

        }

      }

      rule_set { # list

        info_types { # list
          name    = ""     # string | required | Name of the information type. Either a name of your choosing…
          version = ""     # string | optional | Version of the information type to use. By default, the vers…

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

              hotword_regex { # list [0..1]
                group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…
                pattern       = ""     # string | optional | Pattern defining the regular expression. Its syntax (https:/…

              }

              proximity { # list [0..1]
                window_after  = 0      # number | optional | Number of characters after the finding to consider. Either t…
                window_before = 0      # number | optional | Number of characters before the finding to consider. Either …

              }

            }

            exclude_info_types { # list [0..1]

              info_types { # list [1..*]
                name    = ""     # string | required | Name of the information type. Either a name of your choosing…
                version = ""     # string | optional | Version of the information type to use. By default, the vers…

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

            hotword_regex { # list [0..1]
              group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…
              pattern       = ""     # string | optional | Pattern defining the regular expression. Its syntax (https:/…

            }

            likelihood_adjustment { # list [0..1]
              fixed_likelihood    = ""     # string | optional | Set the likelihood of a finding to a fixed value. Either thi…
              relative_likelihood = 0      # number | optional | Increase or decrease the likelihood by the specified number …

            }

            proximity { # list [0..1]
              window_after  = 0      # number | optional | Number of characters after the finding to consider. Either t…
              window_before = 0      # number | optional | Number of characters before the finding to consider. Either …

            }

          }

        }

      }

    }

    storage_config { # list [1..1]

      big_query_options { # list [0..1]
        rows_limit         = 0      # number | optional | Max number of rows to scan. If the table has more rows than …
        rows_limit_percent = 0      # number | optional | Max percentage of rows to scan. The rest are omitted. The nu…
        sample_method      = ""     # string | optional | How to sample rows if not all rows are scanned. Meaningful o…

        excluded_fields { # list
          name = ""     # string | required | Name describing the field excluded from scanning.

        }

        identifying_fields { # list
          name = ""     # string | required | Name of a BigQuery field to be returned with the findings.

        }

        included_fields { # list
          name = ""     # string | required | Name describing the field to which scanning is limited.

        }

        table_reference { # list [1..1]
          dataset_id = ""     # string | required | The dataset ID of the table.
          project_id = ""     # string | required | The Google Cloud Platform project ID of the project containi…
          table_id   = ""     # string | required | The name of the table.

        }

      }

      cloud_storage_options { # list [0..1]
        bytes_limit_per_file         = 0      # number | optional | Max number of bytes to scan from a file. If a scanned file's…
        bytes_limit_per_file_percent = 0      # number | optional | Max percentage of bytes to scan from a file. The rest are om…
        file_types                   = []     # list(string) | optional | List of file type groups to include in the scan. If empty, a…
        files_limit_percent          = 0      # number | optional | Limits the number of files to scan to this percentage of the…
        sample_method                = ""     # string | optional | How to sample bytes if not all bytes are scanned. Meaningful…

        file_set { # list [1..1]
          url = ""     # string | optional | The Cloud Storage url of the file(s) to scan, in the format …

          regex_file_set { # list [0..1]
            bucket_name   = ""     # string | required | The name of a Cloud Storage bucket.
            exclude_regex = []     # list(string) | optional | A list of regular expressions matching file paths to exclude…
            include_regex = []     # list(string) | optional | A list of regular expressions matching file paths to include…

          }

        }

      }

      datastore_options { # list [0..1]

        kind { # list [1..1]
          name = ""     # string | required | The name of the Datastore kind.

        }

        partition_id { # list [1..1]
          project_id   = ""     # string | required | The ID of the project to which the entities belong.
          namespace_id = ""     # string | optional | If not empty, the ID of the namespace to which the entities …

        }

      }

      hybrid_options { # list [0..1]
        description                 = ""     # string | optional | A short description of where the data is coming from. Will b…
        labels                      = {}     # map(string) | optional | To organize findings, these labels will be added to each fin…
        required_finding_label_keys = []     # list(string) | optional | These are labels that each inspection request must include w…

        table_options { # list [0..1]

          identifying_fields { # list
            name = ""     # string | required | Name describing the field.

          }

        }

      }

      timespan_config { # list [0..1]
        enable_auto_population_of_timespan_config = false  # bool | optional | When the job is started by a JobTrigger we will automaticall…
        end_time                                  = ""     # string | optional | Exclude files, tables, or rows newer than this value. If not…
        start_time                                = ""     # string | optional | Exclude files, tables, or rows older than this value. If not…

        timestamp_field { # list [0..1]
          name = ""     # string | required | Specification of the field containing the timestamp of scann…

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  triggers { # list [1..*]

    manual {} # list [0..1]

    schedule { # list [0..1]
      recurrence_period_duration = ""     # string | optional | With this option a job is started a regular periodic basis. …

    }

  }

}

