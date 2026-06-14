# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_logging_sink                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_logging_sink" "this" {

  id               = ""     # string | required | Required. An identifier for the resource in format: "project…

  # bigquery_options = [  # list(object)
  #   {
  #     use_partitioned_tables = false
  #   }
  # ]
  # description      = ""     # string | computed | A description of this sink. The maximum length of the descri…
  # destination      = ""     # string | computed | The destination of the sink (or, in other words, where logs …
  # disabled         = false  # bool | computed | If set to True, then this sink is disabled and it does not e…
  # exclusions = [  # list(object)
  #   {
  #     description = ""
  #     disabled = false
  #     filter = ""
  #     name = ""
  #   }
  # ]
  # filter           = ""     # string | computed | The filter to apply when exporting logs. Only log entries th…
  # name             = ""     # string | computed | The name of the logging sink.
  # writer_identity  = ""     # string | computed | The identity associated with this sink. This identity must b…

}

