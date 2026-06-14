# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_route                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_route" "this" {

  mesh_name           = ""     # string | required
  name                = ""     # string | required
  virtual_router_name = ""     # string | required
  id                  = ""     # string | optional+computed
  mesh_owner          = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_date        = ""     # string | computed
  # last_updated_date   = ""     # string | computed
  # resource_owner      = ""     # string | computed

  spec { # list [1..1]
    priority = 0      # number | optional

    grpc_route { # list [0..1]

      action { # list [1..1]

        weighted_target { # set [1..10]
          virtual_node = ""     # string | required
          weight       = 0      # number | required
          port         = 0      # number | optional+computed

        }

      }

      match { # list [0..1]
        method_name  = ""     # string | optional
        port         = 0      # number | optional
        prefix       = ""     # string | optional
        service_name = ""     # string | optional

        metadata { # set [0..10]
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

      }

      retry_policy { # list [0..1]
        max_retries       = 0      # number | required
        grpc_retry_events = []     # set(string) | optional
        http_retry_events = []     # set(string) | optional
        tcp_retry_events  = []     # set(string) | optional

        per_retry_timeout { # list [1..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

      timeout { # list [0..1]

        idle { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

        per_request { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

    http2_route { # list [0..1]

      action { # list [1..1]

        weighted_target { # set [1..10]
          virtual_node = ""     # string | required
          weight       = 0      # number | required
          port         = 0      # number | optional+computed

        }

      }

      match { # list [1..1]
        method = ""     # string | optional
        port   = 0      # number | optional
        prefix = ""     # string | optional
        scheme = ""     # string | optional

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

      retry_policy { # list [0..1]
        max_retries       = 0      # number | required
        http_retry_events = []     # set(string) | optional
        tcp_retry_events  = []     # set(string) | optional

        per_retry_timeout { # list [1..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

      timeout { # list [0..1]

        idle { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

        per_request { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

    http_route { # list [0..1]

      action { # list [1..1]

        weighted_target { # set [1..10]
          virtual_node = ""     # string | required
          weight       = 0      # number | required
          port         = 0      # number | optional+computed

        }

      }

      match { # list [1..1]
        method = ""     # string | optional
        port   = 0      # number | optional
        prefix = ""     # string | optional
        scheme = ""     # string | optional

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

      retry_policy { # list [0..1]
        max_retries       = 0      # number | required
        http_retry_events = []     # set(string) | optional
        tcp_retry_events  = []     # set(string) | optional

        per_retry_timeout { # list [1..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

      timeout { # list [0..1]

        idle { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

        per_request { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

    tcp_route { # list [0..1]

      action { # list [1..1]

        weighted_target { # set [1..10]
          virtual_node = ""     # string | required
          weight       = 0      # number | required
          port         = 0      # number | optional+computed

        }

      }

      match { # list [0..1]
        port = 0      # number | optional

      }

      timeout { # list [0..1]

        idle { # list [0..1]
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

  }

}

