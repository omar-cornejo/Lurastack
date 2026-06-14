# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_spanner_database                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_spanner_database" "this" {

  instance                 = ""     # string | required | The instance to create the database on.
  name                     = ""     # string | required | A unique identifier for the database, which cannot be change…
  database_dialect         = ""     # string | optional+computed | The dialect of the Cloud Spanner Database. If it is not prov…
  ddl                      = []     # list(string) | optional | An optional list of DDL statements to run inside the newly c…
  deletion_protection      = false  # bool | optional | Whether Terraform will be prevented from destroying the data…
  enable_drop_protection   = false  # bool | optional | Whether drop protection is enabled for this database. Defaul…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed
  version_retention_period = ""     # string | optional+computed | The retention period for the database. The retention period …

  # state                    = ""     # string | computed | An explanation of the status of the database.

  encryption_config { # list [0..1]
    kms_key_name = ""     # string | required | Fully qualified name of the KMS key to use to encrypt this d…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

