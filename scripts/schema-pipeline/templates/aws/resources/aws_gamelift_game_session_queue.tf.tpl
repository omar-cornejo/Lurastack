# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_game_session_queue                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_game_session_queue" "this" {

  name                = ""     # string | required
  custom_event_data   = ""     # string | optional
  destinations        = []     # list(string) | optional
  id                  = ""     # string | optional+computed
  notification_target = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  timeout_in_seconds  = 0      # number | optional

  # arn                 = ""     # string | computed

  player_latency_policy { # list
    maximum_individual_player_latency_milliseconds = 0      # number | required
    policy_duration_seconds                        = 0      # number | optional

  }

}

