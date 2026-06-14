# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_custom_model                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_custom_model" "this" {

  base_model_identifier   = ""     # string | required
  custom_model_name       = ""     # string | required
  hyperparameters         = {}     # map(string) | required
  job_name                = ""     # string | required
  role_arn                = ""     # string | required
  custom_model_kms_key_id = ""     # string | optional
  customization_type      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional

  # custom_model_arn        = ""     # string | computed
  # id                      = ""     # string | computed
  # job_arn                 = ""     # string | computed
  # job_status              = ""     # string | computed
  # tags_all                = {}     # map(string) | computed
  # training_metrics = [  # list(object)
  #   {
  #     training_loss = 0
  #   }
  # ]
  # validation_metrics = [  # list(object)
  #   {
  #     validation_loss = 0
  #   }
  # ]

  output_data_config { # list
    s3_uri = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  training_data_config { # list
    s3_uri = ""     # string | required

  }

  validation_data_config { # list

    validator { # list
      s3_uri = ""     # string | required

    }

  }

  vpc_config { # list
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required

  }

}

