# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector2_filter                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector2_filter" "this" {

  action      = ""     # string | required
  name        = ""     # string | required
  description = ""     # string | optional
  reason      = ""     # string | optional
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # tags_all    = {}     # map(string) | computed

  filter_criteria { # list

    aws_account_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    code_vulnerability_detector_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    code_vulnerability_detector_tags { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    code_vulnerability_file_path { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    component_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    component_type { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ec2_instance_image_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ec2_instance_subnet_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ec2_instance_vpc_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ecr_image_architecture { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ecr_image_hash { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ecr_image_pushed_at { # set
      end_inclusive   = ""     # string | optional
      start_inclusive = ""     # string | optional

    }

    ecr_image_registry { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ecr_image_repository_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    ecr_image_tags { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    epss_score { # set
      lower_inclusive = 0      # number | required
      upper_inclusive = 0      # number | required

    }

    exploit_available { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_arn { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_status { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_type { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    first_observed_at { # set
      end_inclusive   = ""     # string | optional
      start_inclusive = ""     # string | optional

    }

    fix_available { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    inspector_score { # set
      lower_inclusive = 0      # number | required
      upper_inclusive = 0      # number | required

    }

    lambda_function_execution_role_arn { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    lambda_function_last_modified_at { # set
      end_inclusive   = ""     # string | optional
      start_inclusive = ""     # string | optional

    }

    lambda_function_layers { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    lambda_function_name { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    lambda_function_runtime { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    last_observed_at { # set
      end_inclusive   = ""     # string | optional
      start_inclusive = ""     # string | optional

    }

    network_protocol { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    port_range { # set
      begin_inclusive = 0      # number | required
      end_inclusive   = 0      # number | required

    }

    related_vulnerabilities { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_id { # set
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

    severity { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    title { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    updated_at { # set
      end_inclusive   = ""     # string | optional
      start_inclusive = ""     # string | optional

    }

    vendor_severity { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    vulnerability_id { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    vulnerability_source { # set
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    vulnerable_packages { # set

      architecture { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      epoch { # list
        lower_inclusive = 0      # number | required
        upper_inclusive = 0      # number | required

      }

      file_path { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      name { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      release { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      source_lambda_layer_arn { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      source_layer_hash { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

      version { # list
        comparison = ""     # string | required
        value      = ""     # string | required

      }

    }

  }

}

