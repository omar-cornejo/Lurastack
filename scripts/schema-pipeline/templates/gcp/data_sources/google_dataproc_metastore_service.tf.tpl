# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataproc_metastore_service                       │
# └──────────────────────────────────────────────────────────────┘
data "google_dataproc_metastore_service" "this" {

  location              = ""     # string | required | The location where the metastore service should reside. The …
  service_id            = ""     # string | required | The ID of the metastore service. The id must contain only le…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional

  # artifact_gcs_uri      = ""     # string | computed | A Cloud Storage URI (starting with gs://) that specifies whe…
  # database_type         = ""     # string | computed | The database type that the Metastore service stores its data…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # encryption_config = [  # list(object)
  #   {
  #     kms_key = ""
  #   }
  # ]
  # endpoint_uri          = ""     # string | computed | The URI of the endpoint used to access the metastore service…
  # hive_metastore_config = [  # list(object)
  #   {
  #     auxiliary_versions = [  # set(object)
  #       {
  #         config_overrides = {}  # map(string)
  #         key = ""
  #         version = ""
  #       }
  #     ]
  #     config_overrides = {}  # map(string)
  #     endpoint_protocol = ""
  #     kerberos_config = [  # list(object)
  #       {
  #         keytab = [  # list(object)
  #           {
  #             cloud_secret = ""
  #           }
  #         ]
  #         krb5_config_gcs_uri = ""
  #         principal = ""
  #       }
  #     ]
  #     version = ""
  #   }
  # ]
  # labels                = {}     # map(string) | computed | User-defined labels for the metastore service.  **Note**: Th…
  # maintenance_window = [  # list(object)
  #   {
  #     day_of_week = ""
  #     hour_of_day = 0
  #   }
  # ]
  # metadata_integration = [  # list(object)
  #   {
  #     data_catalog_config = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #   }
  # ]
  # name                  = ""     # string | computed | The relative resource name of the metastore service.
  # network               = ""     # string | computed | The relative resource name of the VPC network on which the i…
  # network_config = [  # list(object)
  #   {
  #     consumers = [  # list(object)
  #       {
  #         endpoint_uri = ""
  #         subnetwork = ""
  #       }
  #     ]
  #   }
  # ]
  # port                  = 0      # number | computed | The TCP port at which the metastore service is reached. Defa…
  # release_channel       = ""     # string | computed | The release channel of the service. If unspecified, defaults…
  # scaling_config = [  # list(object)
  #   {
  #     instance_size = ""
  #     scaling_factor = 0
  #   }
  # ]
  # scheduled_backup = [  # list(object)
  #   {
  #     backup_location = ""
  #     cron_schedule = ""
  #     enabled = false
  #     time_zone = ""
  #   }
  # ]
  # state                 = ""     # string | computed | The current state of the metastore service.
  # state_message         = ""     # string | computed | Additional information about the current state of the metast…
  # telemetry_config = [  # list(object)
  #   {
  #     log_format = ""
  #   }
  # ]
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # tier                  = ""     # string | computed | The tier of the service. Possible values: ["DEVELOPER", "ENT…
  # uid                   = ""     # string | computed | The globally unique resource identifier of the metastore ser…

}

