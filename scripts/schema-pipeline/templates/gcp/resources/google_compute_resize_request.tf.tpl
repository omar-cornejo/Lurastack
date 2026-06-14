# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_resize_request                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_resize_request" "this" {

  instance_group_manager = ""     # string | required | The name of the managed instance group. The name should conf…
  name                   = ""     # string | required | The name of this resize request. The name must be 1-63 chara…
  resize_by              = 0      # number | required | The number of instances to be created by this resize request…
  zone                   = ""     # string | required | Name of the compute zone scoping this request. Name should c…
  description            = ""     # string | optional | An optional description of this resize-request.
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional+computed

  # creation_timestamp     = ""     # string | computed | The creation timestamp for this resize request in RFC3339 te…
  # state                  = ""     # string | computed | [Output only] Current state of the request.
  # status = [  # list(object)
  #   {
  #     error = [  # list(object)
  #       {
  #         errors = [  # list(object)
  #           {
  #             code = ""
  #             error_details = [  # list(object)
  #               {
  #                 error_info = [  # list(object)
  #                   {
  #                     domain = ""
  #                     metadatas = {}  # map(string)
  #                     reason = ""
  #                   }
  #                 ]
  #                 help = [  # list(object)
  #                   {
  #                     links = [  # list(object)
  #                       {
  #                         description = ""
  #                         url = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 localized_message = [  # list(object)
  #                   {
  #                     locale = ""
  #                     message = ""
  #                   }
  #                 ]
  #                 quota_info = [  # list(object)
  #                   {
  #                     dimensions = {}  # map(string)
  #                     future_limit = 0
  #                     limit = 0
  #                     limit_name = ""
  #                     metric_name = ""
  #                     rollout_status = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             location = ""
  #             message = ""
  #           }
  #         ]
  #       }
  #     ]
  #     last_attempt = [  # list(object)
  #       {
  #         error = [  # list(object)
  #           {
  #             errors = [  # list(object)
  #               {
  #                 code = ""
  #                 error_details = [  # list(object)
  #                   {
  #                     error_info = [  # list(object)
  #                       {
  #                         domain = ""
  #                         metadatas = {}  # map(string)
  #                         reason = ""
  #                       }
  #                     ]
  #                     help = [  # list(object)
  #                       {
  #                         links = [  # list(object)
  #                           {
  #                             description = ...  # string
  #                             url = ...  # string
  #                           }
  #                         ]
  #                       }
  #                     ]
  #                     localized_message = [  # list(object)
  #                       {
  #                         locale = ""
  #                         message = ""
  #                       }
  #                     ]
  #                     quota_info = [  # list(object)
  #                       {
  #                         dimensions = {}  # map(string)
  #                         future_limit = 0
  #                         limit = 0
  #                         limit_name = ""
  #                         metric_name = ""
  #                         rollout_status = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 location = ""
  #                 message = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

  requested_run_duration { # list [0..1]
    seconds = ""     # string | required | Span of time at a resolution of a second. Must be from 0 to …
    nanos   = 0      # number | optional | Span of time that's a fraction of a second at nanosecond res…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

