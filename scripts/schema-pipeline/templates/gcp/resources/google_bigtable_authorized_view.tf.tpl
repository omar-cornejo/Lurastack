# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_authorized_view                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_authorized_view" "this" {

  instance_name       = ""     # string | required | The name of the Bigtable instance in which the authorized vi…
  name                = ""     # string | required | The name of the authorized view. Must be 1-50 characters and…
  table_name          = ""     # string | required | The name of the Bigtable table in which the authorized view …
  deletion_protection = ""     # string | optional+computed | A field to make the authorized view protected against data l…
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  subset_view { # list [0..1]
    row_prefixes = []     # set(string) | optional | Base64-encoded row prefixes to be included in the authorized…

    family_subsets { # set
      family_name        = ""     # string | required | Name of the column family to be included in the authorized v…
      qualifier_prefixes = []     # set(string) | optional | Base64-encoded prefixes for qualifiers of the column family …
      qualifiers         = []     # set(string) | optional | Base64-encoded individual exact column qualifiers of the col…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

