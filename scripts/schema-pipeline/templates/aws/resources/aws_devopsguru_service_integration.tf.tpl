# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devopsguru_service_integration                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devopsguru_service_integration" "this" {


  # id = ""     # string | computed

  kms_server_side_encryption { # list
    kms_key_id    = ""     # string | optional+computed
    opt_in_status = ""     # string | optional+computed
    type          = ""     # string | optional+computed

  }

  logs_anomaly_detection { # list
    opt_in_status = ""     # string | optional+computed

  }

  ops_center { # list
    opt_in_status = ""     # string | optional+computed

  }

}

