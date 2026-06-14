# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_document_ai_warehouse_location               │
# └──────────────────────────────────────────────────────────────┘
resource "google_document_ai_warehouse_location" "this" {

  access_control_mode           = ""     # string | required | The access control mode for accessing the customer data. Pos…
  database_type                 = ""     # string | required | The type of database used to store customer data. Possible v…
  location                      = ""     # string | required | The location in which the instance is to be provisioned. It …
  project_number                = ""     # string | required | The unique identifier of the project.
  document_creator_default_role = ""     # string | optional | The default role for the person who create a document. Possi…
  id                            = ""     # string | optional+computed
  kms_key                       = ""     # string | optional | The KMS key used for CMEK encryption. It is required that th…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

