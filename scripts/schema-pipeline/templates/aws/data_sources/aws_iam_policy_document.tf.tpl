# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_policy_document                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_policy_document" "this" {

  id                        = ""     # string | optional+computed
  override_json             = ""     # string | optional+DEPRECATED
  override_policy_documents = []     # list(string) | optional
  policy_id                 = ""     # string | optional
  source_json               = ""     # string | optional+DEPRECATED
  source_policy_documents   = []     # list(string) | optional
  version                   = ""     # string | optional

  # json                      = ""     # string | computed
  # minified_json             = ""     # string | computed

  statement { # list
    actions       = []     # set(string) | optional
    effect        = ""     # string | optional
    not_actions   = []     # set(string) | optional
    not_resources = []     # set(string) | optional
    resources     = []     # set(string) | optional
    sid           = ""     # string | optional

    condition { # set
      test     = ""     # string | required
      values   = []     # list(string) | required
      variable = ""     # string | required

    }

    not_principals { # set
      identifiers = []     # set(string) | required
      type        = ""     # string | required

    }

    principals { # set
      identifiers = []     # set(string) | required
      type        = ""     # string | required

    }

  }

}

