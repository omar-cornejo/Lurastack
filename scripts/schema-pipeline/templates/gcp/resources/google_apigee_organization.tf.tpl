# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_organization                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_organization" "this" {

  project_id                            = ""     # string | required | The project ID associated with the Apigee organization.
  analytics_region                      = ""     # string | optional | Primary GCP region for analytics data storage. For valid val…
  api_consumer_data_encryption_key_name = ""     # string | optional | Cloud KMS key name used for encrypting API consumer data.
  api_consumer_data_location            = ""     # string | optional | This field is needed only for customers using non-default da…
  authorized_network                    = ""     # string | optional | Compute Engine network used for Service Networking to be pee…
  billing_type                          = ""     # string | optional+computed | Billing type of the Apigee organization. See [Apigee pricing…
  control_plane_encryption_key_name     = ""     # string | optional | Cloud KMS key name used for encrypting control plane data th…
  description                           = ""     # string | optional | Description of the Apigee organization.
  disable_vpc_peering                   = false  # bool | optional | Flag that specifies whether the VPC Peering through Private …
  display_name                          = ""     # string | optional | The display name of the Apigee organization.
  id                                    = ""     # string | optional+computed
  retention                             = ""     # string | optional | Optional. This setting is applicable only for organizations …
  runtime_database_encryption_key_name  = ""     # string | optional | Cloud KMS key name used for encrypting the data that is stor…
  runtime_type                          = ""     # string | optional | Runtime type of the Apigee organization based on the Apigee …

  # apigee_project_id                     = ""     # string | computed | Output only. Project ID of the Apigee Tenant Project.
  # ca_certificate                        = ""     # string | computed | Output only. Base64-encoded public certificate for the root …
  # name                                  = ""     # string | computed | Output only. Name of the Apigee organization.
  # subscription_type                     = ""     # string | computed | Output only. Subscription type of the Apigee organization. V…

  properties { # list [0..1]

    property { # list
      name  = ""     # string | optional | Name of the property.
      value = ""     # string | optional | Value of the property.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

