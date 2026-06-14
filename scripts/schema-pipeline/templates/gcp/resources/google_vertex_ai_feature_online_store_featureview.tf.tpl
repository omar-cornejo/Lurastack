# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_feature_online_store_featureview   │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_feature_online_store_featureview" "this" {

  feature_online_store = ""     # string | required | The name of the FeatureOnlineStore to use for the featurevie…
  region               = ""     # string | required | The region for the resource. It should be the same as the fe…
  id                   = ""     # string | optional+computed
  labels               = {}     # map(string) | optional | A set of key/value label pairs to assign to this FeatureView…
  name                 = ""     # string | optional | Name of the FeatureView. This value may be up to 60 characte…
  project              = ""     # string | optional+computed

  # create_time          = ""     # string | computed | The timestamp of when the featureOnlinestore was created in …
  # effective_labels     = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels     = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time          = ""     # string | computed | The timestamp of when the featureOnlinestore was last update…

  big_query_source { # list [0..1]
    entity_id_columns = []     # list(string) | required | Columns to construct entityId / row keys. Start by supportin…
    uri               = ""     # string | required | The BigQuery view URI that will be materialized on each sync…

  }

  feature_registry_source { # list [0..1]
    project_number = ""     # string | optional | The project number of the parent project of the feature Grou…

    feature_groups { # list [1..*]
      feature_group_id = ""     # string | required | Identifier of the feature group.
      feature_ids      = []     # list(string) | required | Identifiers of features under the feature group.

    }

  }

  sync_config { # list [0..1]
    cron = ""     # string | optional+computed | Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

