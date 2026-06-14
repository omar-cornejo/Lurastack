# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_accessanalyzer_archive_rule                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_accessanalyzer_archive_rule" "this" {

  analyzer_name = ""     # string | required
  rule_name     = ""     # string | required
  id            = ""     # string | optional+computed

  filter { # set [1..*]
    criteria = ""     # string | required
    contains = []     # list(string) | optional+computed
    eq       = []     # list(string) | optional+computed
    exists   = ""     # string | optional+computed
    neq      = []     # list(string) | optional+computed

  }

}

