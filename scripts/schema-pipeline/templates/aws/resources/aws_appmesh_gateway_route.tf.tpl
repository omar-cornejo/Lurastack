# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_gateway_route                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_gateway_route" "this" {

  mesh_name            = ""     # string | required
  name                 = ""     # string | required
  virtual_gateway_name = ""     # string | required
  id                   = ""     # string | optional+computed
  mesh_owner           = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # created_date         = ""     # string | computed
  # last_updated_date    = ""     # string | computed
  # resource_owner       = ""     # string | computed

  spec { # list [1..1]
    priority = 0      # number | optional

    grpc_route { # list [0..1]

      action { # list [1..1]

        target { # list [1..1]
          port = 0      # number | optional

          virtual_service { # list [1..1]
            virtual_service_name = ""     # string | required

          }

        }

      }

      match { # list [1..1]
        service_name = ""     # string | required
        port         = 0      # number | optional

      }

    }

    http2_route { # list [0..1]

      action { # list [1..1]

        rewrite { # list [0..1]

          hostname { # list [0..1]
            default_target_hostname = ""     # string | required

          }

          path { # list [0..1]
            exact = ""     # string | required

          }

          prefix { # list [0..1]
            default_prefix = ""     # string | optional
            value          = ""     # string | optional

          }

        }

        target { # list [1..1]
          port = 0      # number | optional

          virtual_service { # list [1..1]
            virtual_service_name = ""     # string | required

          }

        }

      }

      match { # list [1..1]
        port   = 0      # number | optional
        prefix = ""     # string | optional

        header { # set [0..10]
          name   = ""     # string | required
          invert = false  # bool | optional

          match { # list [0..1]
            exact  = ""     # string | optional
            prefix = ""     # string | optional
            regex  = ""     # string | optional
            suffix = ""     # string | optional

            range { # list [0..1]
              end   = 0      # number | required
              start = 0      # number | required

            }

          }

        }

        hostname { # list [0..1]
          exact  = ""     # string | optional
          suffix = ""     # string | optional

        }

        path { # list [0..1]
          exact = ""     # string | optional
          regex = ""     # string | optional

        }

        query_parameter { # set [0..10]
          name = ""     # string | required

          match { # list [0..1]
            exact = ""     # string | optional

          }

        }

      }

    }

    http_route { # list [0..1]

      action { # list [1..1]

        rewrite { # list [0..1]

          hostname { # list [0..1]
            default_target_hostname = ""     # string | required

          }

          path { # list [0..1]
            exact = ""     # string | required

          }

          prefix { # list [0..1]
            default_prefix = ""     # string | optional
            value          = ""     # string | optional

          }

        }

        target { # list [1..1]
          port = 0      # number | optional

          virtual_service { # list [1..1]
            virtual_service_name = ""     # string | required

          }

        }

      }

      match { # list [1..1]
        port   = 0      # number | optional
        prefix = ""     # string | optional

        header { # set [0..10]
          name   = ""     # string | required
          invert = false  # bool | optional

          match { # list [0..1]
            exact  = ""     # string | optional
            prefix = ""     # string | optional
            regex  = ""     # string | optional
            suffix = ""     # string | optional

            range { # list [0..1]
              end   = 0      # number | required
              start = 0      # number | required

            }

          }

        }

        hostname { # list [0..1]
          exact  = ""     # string | optional
          suffix = ""     # string | optional

        }

        path { # list [0..1]
          exact = ""     # string | optional
          regex = ""     # string | optional

        }

        query_parameter { # set [0..10]
          name = ""     # string | required

          match { # list [0..1]
            exact = ""     # string | optional

          }

        }

      }

    }

  }

}

