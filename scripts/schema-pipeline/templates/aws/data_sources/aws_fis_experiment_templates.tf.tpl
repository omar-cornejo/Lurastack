# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fis_experiment_templates                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_fis_experiment_templates" "this" {

  tags = {}     # map(string) | optional

  # ids  = []     # list(string) | computed

}

