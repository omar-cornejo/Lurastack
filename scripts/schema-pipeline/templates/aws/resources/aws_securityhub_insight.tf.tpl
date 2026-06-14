# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_insight                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_insight" "this" {

  group_by_attribute = ""     # string | required
  name               = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed

  filters { # list [1..1]

    aws_account_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    company_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    compliance_status { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    confidence { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    created_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    criticality { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    description { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_provider_fields_confidence { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    finding_provider_fields_criticality { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    finding_provider_fields_related_findings_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_provider_fields_related_findings_product_arn { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_provider_fields_severity_label { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_provider_fields_severity_original { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    finding_provider_fields_types { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    first_observed_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    generator_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    keyword { # set [0..20]
      value = ""     # string | required

    }

    last_observed_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    malware_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    malware_path { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    malware_state { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    malware_type { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_destination_domain { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_destination_ipv4 { # set [0..20]
      cidr = ""     # string | required

    }

    network_destination_ipv6 { # set [0..20]
      cidr = ""     # string | required

    }

    network_destination_port { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    network_direction { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_protocol { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_source_domain { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_source_ipv4 { # set [0..20]
      cidr = ""     # string | required

    }

    network_source_ipv6 { # set [0..20]
      cidr = ""     # string | required

    }

    network_source_mac { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    network_source_port { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    note_text { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    note_updated_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    note_updated_by { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    process_launched_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    process_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    process_parent_pid { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    process_path { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    process_pid { # set [0..20]
      eq  = ""     # string | optional
      gte = ""     # string | optional
      lte = ""     # string | optional

    }

    process_terminated_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    product_arn { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    product_fields { # set [0..20]
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    product_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    recommendation_text { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    record_state { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    related_findings_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    related_findings_product_arn { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_iam_instance_profile_arn { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_image_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_ipv4_addresses { # set [0..20]
      cidr = ""     # string | required

    }

    resource_aws_ec2_instance_ipv6_addresses { # set [0..20]
      cidr = ""     # string | required

    }

    resource_aws_ec2_instance_key_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_launched_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    resource_aws_ec2_instance_subnet_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_type { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_ec2_instance_vpc_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_iam_access_key_created_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    resource_aws_iam_access_key_status { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_iam_access_key_user_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_s3_bucket_owner_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_aws_s3_bucket_owner_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_container_image_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_container_image_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_container_launched_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    resource_container_name { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_details_other { # set [0..20]
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    resource_id { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_partition { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_region { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    resource_tags { # set [0..20]
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    resource_type { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    severity_label { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    source_url { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    threat_intel_indicator_category { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    threat_intel_indicator_last_observed_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    threat_intel_indicator_source { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    threat_intel_indicator_source_url { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    threat_intel_indicator_type { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    threat_intel_indicator_value { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    title { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    type { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    updated_at { # set [0..20]
      end   = ""     # string | optional
      start = ""     # string | optional

      date_range { # list [0..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

    user_defined_values { # set [0..20]
      comparison = ""     # string | required
      key        = ""     # string | required
      value      = ""     # string | required

    }

    verification_state { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

    workflow_status { # set [0..20]
      comparison = ""     # string | required
      value      = ""     # string | required

    }

  }

}

