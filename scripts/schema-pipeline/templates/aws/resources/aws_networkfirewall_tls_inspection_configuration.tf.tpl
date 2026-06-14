# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_tls_inspection_configuration    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_tls_inspection_configuration" "this" {

  name                            = ""     # string | required
  description                     = ""     # string | optional
  encryption_configuration        = []     # list(object({ key_id: string, type: string })) | optional+computed
  tags                            = {}     # map(string) | optional

  # arn                             = ""     # string | computed
  # certificate_authority = [  # list(object)
  #   {
  #     certificate_arn = ""
  #     certificate_serial = ""
  #     status = ""
  #     status_message = ""
  #   }
  # ]
  # certificates = [  # list(object)
  #   {
  #     certificate_arn = ""
  #     certificate_serial = ""
  #     status = ""
  #     status_message = ""
  #   }
  # ]
  # id                              = ""     # string | computed
  # number_of_associations          = 0      # number | computed
  # tags_all                        = {}     # map(string) | computed
  # tls_inspection_configuration_id = ""     # string | computed
  # update_token                    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  tls_inspection_configuration { # list

    server_certificate_configuration { # list
      certificate_authority_arn = ""     # string | optional

      check_certificate_revocation_status { # list
        revoked_status_action = ""     # string | optional
        unknown_status_action = ""     # string | optional

      }

      scope { # list
        protocols = []     # set(number) | required

        destination { # list
          address_definition = ""     # string | required

        }

        destination_ports { # list
          from_port = 0      # number | required
          to_port   = 0      # number | required

        }

        source { # list
          address_definition = ""     # string | required

        }

        source_ports { # list
          from_port = 0      # number | required
          to_port   = 0      # number | required

        }

      }

      server_certificate { # list
        resource_arn = ""     # string | optional

      }

    }

  }

}

