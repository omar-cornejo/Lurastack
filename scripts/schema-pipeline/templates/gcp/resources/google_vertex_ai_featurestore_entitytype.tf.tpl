# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_featurestore_entitytype            │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_featurestore_entitytype" "this" {

  featurestore     = ""     # string | required | The name of the Featurestore to use, in the format projects/…
  description      = ""     # string | optional | Optional. Description of the EntityType.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | A set of key/value label pairs to assign to this EntityType.…
  name             = ""     # string | optional | The name of the EntityType. This value may be up to 60 chara…

  # create_time      = ""     # string | computed | The timestamp of when the featurestore was created in RFC333…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # region           = ""     # string | computed | The region of the EntityType.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp of when the featurestore was last updated in R…

  monitoring_config { # list [0..1]

    categorical_threshold_config { # list [0..1]
      value = 0      # number | required | Specify a threshold value that can trigger the alert. For ca…

    }

    import_features_analysis { # list [0..1]
      anomaly_detection_baseline = ""     # string | optional | Defines the baseline to do anomaly detection for feature val…
      state                      = ""     # string | optional | Whether to enable / disable / inherite default hebavior for …

    }

    numerical_threshold_config { # list [0..1]
      value = 0      # number | required | Specify a threshold value that can trigger the alert. For nu…

    }

    snapshot_analysis { # list [0..1]
      disabled                 = false  # bool | optional | The monitoring schedule for snapshot analysis. For EntityTyp…
      monitoring_interval_days = 0      # number | optional | Configuration of the snapshot analysis based monitoring pipe…
      staleness_days           = 0      # number | optional | Customized export features time window for snapshot analysis…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

