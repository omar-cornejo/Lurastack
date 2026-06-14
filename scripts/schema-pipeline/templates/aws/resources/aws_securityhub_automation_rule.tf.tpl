# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_automation_rule                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_automation_rule" "this" {

  description = ""     # string | required
  rule_name   = ""     # string | required
  rule_order  = 0      # number | required
  is_terminal = false  # bool | optional+computed
  rule_status = ""     # string | optional+computed
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # id          = ""     # string | computed
  # tags_all    = {}     # map(string) | computed

  actions { # set
    type = ""     # string | optional

    finding_fields_update { # list
      confidence          = 0      # number | optional
      criticality         = 0      # number | optional
      types               = []     # list(string) | optional
      user_defined_fields = {}     # map(string) | optional
      verification_state  = ""     # string | optional

      note { # list
        text       = ""     # string | required
        updated_by = ""     # string | required

      }

      related_findings { # set
        id          = ""     # string | required
        product_arn = ""     # string | required

      }

      severity { # list
        label   = ""     # string | optional+computed
        product = 0      # number | optional

      }

      workflow { # list
        status = ""     # string | optional

      }

    }

  }

  criteria { # list

    aws_account_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    aws_account_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    company_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    compliance_associated_standards_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    compliance_security_control_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    compliance_status { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    confidence { # set
      eq  = 0      # number | optional
      gt  = 0      # number | optional
      gte = 0      # number | optional
      lt  = 0      # number | optional
      lte = 0      # number | optional

    }

    created_at { # set
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    criticality { # set
      eq  = 0      # number | optional
      gt  = 0      # number | optional
      gte = 0      # number | optional
      lt  = 0      # number | optional
      lte = 0      # number | optional

    }

    description { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    first_observed_at { # set
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    generator_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    last_observed_at { # set
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    note_text { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    note_updated_at { # set
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    note_updated_by { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    product_arn { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    product_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    record_state { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    related_findings_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    related_findings_product_arn { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_application_arn { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_application_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_details_other { # set
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    resource_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_partition { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_region { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_tags { # set
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    resource_type { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    severity_label { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    source_url { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    title { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    type { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    updated_at { # set
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    user_defined_fields { # set
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    verification_state { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    workflow_status { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

  }

}

