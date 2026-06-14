# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspaces_connection_alias                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspaces_connection_alias" "this" {

  connection_string = ""     # string | required | The connection string specified for the connection alias. Th…
  tags              = {}     # map(string) | optional

  # id                = ""     # string | computed
  # owner_account_id  = ""     # string | computed | The identifier of the Amazon Web Services account that owns …
  # state             = ""     # string | computed | The current state of the connection alias.
  # tags_all          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

