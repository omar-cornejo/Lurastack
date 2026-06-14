# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_taxonomy                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_taxonomy" "this" {

  display_name           = ""     # string | required | User defined name of this taxonomy. The taxonomy display nam…
  activated_policy_types = []     # list(string) | optional | A list of policy types that are activated for this taxonomy.…
  description            = ""     # string | optional | Description of this taxonomy. It must: contain only unicode …
  id                     = ""     # string | optional+computed
  project                = ""     # string | optional+computed
  region                 = ""     # string | optional+computed | Taxonomy location region.

  # name                   = ""     # string | computed | Resource name of this taxonomy, whose format is: "projects/{…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

