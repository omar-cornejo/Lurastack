# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrock_custom_model                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrock_custom_model" "this" {

  model_id               = ""     # string | required

  # base_model_arn         = ""     # string | computed
  # creation_time          = ""     # string | computed
  # hyperparameters        = {}     # map(string) | computed
  # id                     = ""     # string | computed
  # job_arn                = ""     # string | computed
  # job_name               = ""     # string | computed
  # job_tags               = {}     # map(string) | computed
  # model_arn              = ""     # string | computed
  # model_kms_key_arn      = ""     # string | computed
  # model_name             = ""     # string | computed
  # model_tags             = {}     # map(string) | computed
  # output_data_config = [  # list(object)
  #   {
  #     s3_uri = ""
  #   }
  # ]
  # training_data_config = [  # list(object)
  #   {
  #     s3_uri = ""
  #   }
  # ]
  # training_metrics = [  # list(object)
  #   {
  #     training_loss = 0
  #   }
  # ]
  # validation_data_config = [  # list(object)
  #   {
  #     validator = [  # list(object)
  #       {
  #         s3_uri = ""
  #       }
  #     ]
  #   }
  # ]
  # validation_metrics = [  # list(object)
  #   {
  #     validation_loss = 0
  #   }
  # ]

}

