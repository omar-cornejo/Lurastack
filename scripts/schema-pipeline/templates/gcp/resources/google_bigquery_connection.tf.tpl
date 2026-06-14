# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_connection                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_connection" "this" {

  connection_id  = ""     # string | optional+computed | Optional connection id that should be assigned to the create…
  description    = ""     # string | optional | A descriptive description for the connection
  friendly_name  = ""     # string | optional | A descriptive name for the connection
  id             = ""     # string | optional+computed
  kms_key_name   = ""     # string | optional | Optional. The Cloud KMS key that is used for encryption.  Ex…
  location       = ""     # string | optional | The geographic location where the connection should reside. …
  project        = ""     # string | optional+computed

  # has_credential = false  # bool | computed | True if the connection has credential assigned.
  # name           = ""     # string | computed | The resource name of the connection in the form of: "project…

  aws { # list [0..1]

    access_role { # list [1..1]
      iam_role_id = ""     # string | required | The user’s AWS IAM Role that trusts the Google-owned AWS IAM…

      # identity    = ""     # string | computed | A unique Google-owned and Google-generated identity for the …

    }

  }

  azure { # list [0..1]
    customer_tenant_id              = ""     # string | required | The id of customer's directory that host the data.
    federated_application_client_id = ""     # string | optional | The Azure Application (client) ID where the federated creden…

    # application                     = ""     # string | computed | The name of the Azure Active Directory Application.
    # client_id                       = ""     # string | computed | The client id of the Azure Active Directory Application.
    # identity                        = ""     # string | computed | A unique Google-owned and Google-generated identity for the …
    # object_id                       = ""     # string | computed | The object id of the Azure Active Directory Application.
    # redirect_uri                    = ""     # string | computed | The URL user will be redirected to after granting consent du…

  }

  cloud_resource { # list [0..1]

    # service_account_id = ""     # string | computed | The account ID of the service created for the purpose of thi…

  }

  cloud_spanner { # list [0..1]
    database                 = ""     # string | required | Cloud Spanner database in the form 'project/instance/databas…
    database_role            = ""     # string | optional | Cloud Spanner database role for fine-grained access control.…
    max_parallelism          = 0      # number | optional | Allows setting max parallelism per query when executing on S…
    use_data_boost           = false  # bool | optional | If set, the request will be executed via Spanner independent…
    use_parallelism          = false  # bool | optional | If parallelism should be used when reading from Cloud Spanne…
    use_serverless_analytics = false  # bool | optional+DEPRECATED | If the serverless analytics service should be used to read d…

  }

  cloud_sql { # list [0..1]
    database           = ""     # string | required | Database name.
    instance_id        = ""     # string | required | Cloud SQL instance ID in the form project:location:instance.
    type               = ""     # string | required | Type of the Cloud SQL database. Possible values: ["DATABASE_…

    # service_account_id = ""     # string | computed | When the connection is used in the context of an operation i…

    credential { # list [1..1]
      password = ""     # string | required+sensitive | Password for database.
      username = ""     # string | required | Username for database.

    }

  }

  spark { # list [0..1]

    # service_account_id = ""     # string | computed | The account ID of the service created for the purpose of thi…

    metastore_service_config { # list [0..1]
      metastore_service = ""     # string | optional | Resource name of an existing Dataproc Metastore service in t…

    }

    spark_history_server_config { # list [0..1]
      dataproc_cluster = ""     # string | optional | Resource name of an existing Dataproc Cluster to act as a Sp…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

