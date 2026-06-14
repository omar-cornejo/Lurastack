# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_policy_tag                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_policy_tag" "this" {

  display_name      = ""     # string | required | User defined name of this policy tag. It must: be unique wit…
  taxonomy          = ""     # string | required | Taxonomy the policy tag is associated with
  description       = ""     # string | optional | Description of this policy tag. It must: contain only unicod…
  id                = ""     # string | optional+computed
  parent_policy_tag = ""     # string | optional | Resource name of this policy tag's parent policy tag. If emp…

  # child_policy_tags = []     # list(string) | computed | Resource names of child policy tags of this policy tag.
  # name              = ""     # string | computed | Resource name of this policy tag, whose format is: "projects…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

