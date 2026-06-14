# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeguruprofiler_profiling_group                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeguruprofiler_profiling_group" "this" {

  name             = ""     # string | required
  compute_platform = ""     # string | optional+computed
  tags             = {}     # map(string) | optional

  # arn              = ""     # string | computed
  # id               = ""     # string | computed
  # tags_all         = {}     # map(string) | computed

  agent_orchestration_config { # list
    profiling_enabled = false  # bool | required

  }

}

