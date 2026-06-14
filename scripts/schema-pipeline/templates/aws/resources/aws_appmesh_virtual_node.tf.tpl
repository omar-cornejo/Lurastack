# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_virtual_node                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_virtual_node" "this" {

  mesh_name         = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed
  mesh_owner        = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # resource_owner    = ""     # string | computed

  spec { # list [1..1]

    backend { # set

      virtual_service { # list [1..1]
        virtual_service_name = ""     # string | required

        client_policy { # list [0..1]

          tls { # list [0..1]
            enforce = false  # bool | optional
            ports   = []     # set(number) | optional

            certificate { # list [0..1]

              file { # list [0..1]
                certificate_chain = ""     # string | required
                private_key       = ""     # string | required

              }

              sds { # list [0..1]
                secret_name = ""     # string | required

              }

            }

            validation { # list [1..1]

              subject_alternative_names { # list [0..1]

                match { # list [1..1]
                  exact = []     # set(string) | required

                }

              }

              trust { # list [1..1]

                acm { # list [0..1]
                  certificate_authority_arns = []     # set(string) | required

                }

                file { # list [0..1]
                  certificate_chain = ""     # string | required

                }

                sds { # list [0..1]
                  secret_name = ""     # string | required

                }

              }

            }

          }

        }

      }

    }

    backend_defaults { # list [0..1]

      client_policy { # list [0..1]

        tls { # list [0..1]
          enforce = false  # bool | optional
          ports   = []     # set(number) | optional

          certificate { # list [0..1]

            file { # list [0..1]
              certificate_chain = ""     # string | required
              private_key       = ""     # string | required

            }

            sds { # list [0..1]
              secret_name = ""     # string | required

            }

          }

          validation { # list [1..1]

            subject_alternative_names { # list [0..1]

              match { # list [1..1]
                exact = []     # set(string) | required

              }

            }

            trust { # list [1..1]

              acm { # list [0..1]
                certificate_authority_arns = []     # set(string) | required

              }

              file { # list [0..1]
                certificate_chain = ""     # string | required

              }

              sds { # list [0..1]
                secret_name = ""     # string | required

              }

            }

          }

        }

      }

    }

    listener { # list

      connection_pool { # list [0..1]

        grpc { # list [0..1]
          max_requests = 0      # number | required

        }

        http { # list
          max_connections      = 0      # number | required
          max_pending_requests = 0      # number | optional

        }

        http2 { # list
          max_requests = 0      # number | required

        }

        tcp { # list
          max_connections = 0      # number | required

        }

      }

      health_check { # list [0..1]
        healthy_threshold   = 0      # number | required
        interval_millis     = 0      # number | required
        protocol            = ""     # string | required
        timeout_millis      = 0      # number | required
        unhealthy_threshold = 0      # number | required
        path                = ""     # string | optional
        port                = 0      # number | optional+computed

      }

      outlier_detection { # list [0..1]
        max_ejection_percent = 0      # number | required
        max_server_errors    = 0      # number | required

        base_ejection_duration { # list [1..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

        interval { # list [1..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

      port_mapping { # list [1..1]
        port     = 0      # number | required
        protocol = ""     # string | required

      }

      timeout { # list [0..1]

        grpc { # list [0..1]

          idle { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

          per_request { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

        }

        http { # list [0..1]

          idle { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

          per_request { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

        }

        http2 { # list [0..1]

          idle { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

          per_request { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

        }

        tcp { # list [0..1]

          idle { # list [0..1]
            unit  = ""     # string | required
            value = 0      # number | required

          }

        }

      }

      tls { # list [0..1]
        mode = ""     # string | required

        certificate { # list [1..1]

          acm { # list [0..1]
            certificate_arn = ""     # string | required

          }

          file { # list [0..1]
            certificate_chain = ""     # string | required
            private_key       = ""     # string | required

          }

          sds { # list [0..1]
            secret_name = ""     # string | required

          }

        }

        validation { # list [0..1]

          subject_alternative_names { # list [0..1]

            match { # list [1..1]
              exact = []     # set(string) | required

            }

          }

          trust { # list [1..1]

            file { # list [0..1]
              certificate_chain = ""     # string | required

            }

            sds { # list [0..1]
              secret_name = ""     # string | required

            }

          }

        }

      }

    }

    logging { # list [0..1]

      access_log { # list [0..1]

        file { # list [0..1]
          path = ""     # string | required

          format { # list [0..1]
            text = ""     # string | optional

            json { # list
              key   = ""     # string | required
              value = ""     # string | required

            }

          }

        }

      }

    }

    service_discovery { # list [0..1]

      aws_cloud_map { # list [0..1]
        namespace_name = ""     # string | required
        service_name   = ""     # string | required
        attributes     = {}     # map(string) | optional

      }

      dns { # list [0..1]
        hostname      = ""     # string | required
        ip_preference = ""     # string | optional
        response_type = ""     # string | optional

      }

    }

  }

}

