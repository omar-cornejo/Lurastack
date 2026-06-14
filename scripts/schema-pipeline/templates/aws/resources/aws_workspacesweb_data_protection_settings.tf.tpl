# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_data_protection_settings          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_data_protection_settings" "this" {

  display_name                  = ""     # string | required
  additional_encryption_context = {}     # map(string) | optional
  customer_managed_key          = ""     # string | optional
  description                   = ""     # string | optional
  tags                          = {}     # map(string) | optional

  # associated_portal_arns        = []     # list(string) | computed
  # data_protection_settings_arn  = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  inline_redaction_configuration { # list
    global_confidence_level = 0      # number | optional
    global_enforced_urls    = []     # list(string) | optional
    global_exempt_urls      = []     # list(string) | optional

    inline_redaction_pattern { # list
      built_in_pattern_id = ""     # string | optional
      confidence_level    = 0      # number | optional
      enforced_urls       = []     # list(string) | optional
      exempt_urls         = []     # list(string) | optional

      custom_pattern { # list
        pattern_name        = ""     # string | required
        pattern_regex       = ""     # string | required
        keyword_regex       = ""     # string | optional
        pattern_description = ""     # string | optional

      }

      redaction_place_holder { # list
        redaction_place_holder_type = ""     # string | required
        redaction_place_holder_text = ""     # string | optional

      }

    }

  }

}

