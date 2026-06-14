# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_mlflow_tracking_server                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_mlflow_tracking_server" "this" {

  artifact_store_uri              = ""     # string | required
  role_arn                        = ""     # string | required
  tracking_server_name            = ""     # string | required
  automatic_model_registration    = false  # bool | optional
  id                              = ""     # string | optional+computed
  mlflow_version                  = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  tracking_server_size            = ""     # string | optional
  weekly_maintenance_window_start = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # tracking_server_url             = ""     # string | computed

}

