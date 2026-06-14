# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_loss_prevention_deidentify_template     │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_loss_prevention_deidentify_template" "this" {

  parent       = ""     # string | required | The parent of the template in any of the following formats: …
  description  = ""     # string | optional | A description of the template.
  display_name = ""     # string | optional | User set display name of the template.
  id           = ""     # string | optional+computed
  template_id  = ""     # string | optional+computed | The template id can contain uppercase and lowercase letters,…

  # create_time  = ""     # string | computed | The creation timestamp of an deidentifyTemplate. Set by the …
  # name         = ""     # string | computed | The resource name of the template. Set by the server.
  # update_time  = ""     # string | computed | The last update timestamp of an deidentifyTemplate. Set by t…

  deidentify_config { # list [1..1]

    image_transformations { # list [0..1]

      transforms { # list [1..*]

        all_info_types {} # list [0..1]

        all_text {} # list [0..1]

        redaction_color { # list [0..1]
          blue  = 0      # number | optional | The amount of blue in the color as a value in the interval […
          green = 0      # number | optional | The amount of green in the color as a value in the interval …
          red   = 0      # number | optional | The amount of red in the color as a value in the interval [0…

        }

        selected_info_types { # list [0..1]

          info_types { # list [1..*]
            name    = ""     # string | required | Name of the information type.
            version = ""     # string | optional | Version name for this InfoType.

            sensitivity_score { # list [0..1]
              score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

            }

          }

        }

      }

    }

    info_type_transformations { # list [0..1]

      transformations { # list [1..*]

        info_types { # list
          name    = ""     # string | required | Name of the information type.
          version = ""     # string | optional | Version name for this InfoType.

          sensitivity_score { # list [0..1]
            score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

          }

        }

        primitive_transformation { # list [1..1]
          replace_with_info_type_config = false  # bool | optional | Replace each matching finding with the name of the info type…

          bucketing_config { # list [0..1]

            buckets { # list

              max { # list [0..1]
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

              min { # list [0..1]
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

              replacement_value { # list [1..1]
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

            }

          }

          character_mask_config { # list [0..1]
            masking_character = ""     # string | optional | Character to use to mask the sensitive values—for example, *…
            number_to_mask    = 0      # number | optional | Number of characters to mask. If not set, all matching chars…
            reverse_order     = false  # bool | optional | Mask characters in reverse order. For example, if masking_ch…

            characters_to_ignore { # list
              characters_to_skip          = ""     # string | optional | Characters to not transform when masking.
              common_characters_to_ignore = ""     # string | optional | Common characters to not transform when masking. Useful to a…

            }

          }

          crypto_deterministic_config { # list [0..1]

            context { # list [0..1]
              name = ""     # string | optional | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

            surrogate_info_type { # list [0..1]
              name    = ""     # string | optional | Name of the information type. Either a name of your choosing…
              version = ""     # string | optional | Optional version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

          }

          crypto_hash_config { # list [0..1]

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

          }

          crypto_replace_ffx_fpe_config { # list [0..1]
            common_alphabet = ""     # string | optional | Common alphabets. Possible values: ["FFX_COMMON_NATIVE_ALPHA…
            custom_alphabet = ""     # string | optional | This is supported by mapping these to the alphanumeric chara…
            radix           = 0      # number | optional | The native way to select the alphabet. Must be in the range …

            context { # list [0..1]
              name = ""     # string | optional | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

            surrogate_info_type { # list [0..1]
              name    = ""     # string | optional | Name of the information type. Either a name of your choosing…
              version = ""     # string | optional | Optional version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

          }

          date_shift_config { # list [0..1]
            lower_bound_days = 0      # number | required | Range of shift in days. Negative means shift to earlier in t…
            upper_bound_days = 0      # number | required | Range of shift in days. Actual shift will be selected at ran…

            context { # list [0..1]
              name = ""     # string | required | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key. A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key. A base64-encoded string.

              }

            }

          }

          fixed_size_bucketing_config { # list [0..1]
            bucket_size = 0      # number | required | Size of each bucket (except for minimum and maximum buckets)…

            lower_bound { # list [1..1]
              float_value   = 0      # number | optional | A float value.
              integer_value = ""     # string | optional | An integer value (int64 format)

            }

            upper_bound { # list [1..1]
              float_value   = 0      # number | optional | A float value.
              integer_value = ""     # string | optional | An integer value (int64 format)

            }

          }

          redact_config {} # list [0..1]

          replace_config { # list [0..1]

            new_value { # list [1..1]
              boolean_value     = false  # bool | optional | A boolean value.
              day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
              float_value       = 0      # number | optional | A float value.
              integer_value     = 0      # number | optional | An integer value.
              string_value      = ""     # string | optional | A string value.
              timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

              date_value { # list [0..1]
                day   = 0      # number | optional | Day of month. Must be from 1 to 31 and valid for the year an…
                month = 0      # number | optional | Month of year. Must be from 1 to 12, or 0 if specifying a ye…
                year  = 0      # number | optional | Year of date. Must be from 1 to 9999, or 0 if specifying a d…

              }

              time_value { # list [0..1]
                hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23.
                minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

              }

            }

          }

          replace_dictionary_config { # list [0..1]

            word_list { # list [1..1]
              words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

            }

          }

          time_part_config { # list [0..1]
            part_to_extract = ""     # string | optional | The part of the time to keep. Possible values: ["YEAR", "MON…

          }

        }

      }

    }

    record_transformations { # list [0..1]

      field_transformations { # list

        condition { # list [0..1]

          expressions { # list [0..1]
            logical_operator = ""     # string | optional | The operator to apply to the result of conditions. Default a…

            conditions { # list [0..1]

              conditions { # list
                operator = ""     # string | required | Operator used to compare the field or infoType to the value.…

                field { # list [1..1]
                  name = ""     # string | optional | Name describing the field.

                }

                value { # list [0..1]
                  boolean_value     = false  # bool | optional | A boolean value.
                  day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                  float_value       = 0      # number | optional | A float value.
                  integer_value     = ""     # string | optional | An integer value (int64 format)
                  string_value      = ""     # string | optional | A string value.
                  timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                  date_value { # list [0..1]
                    day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                    month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                    year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                  }

                  time_value { # list [0..1]
                    hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                    minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                    nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                    seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                  }

                }

              }

            }

          }

        }

        fields { # list [1..*]
          name = ""     # string | optional | Name describing the field.

        }

        info_type_transformations { # list [0..1]

          transformations { # list [1..*]

            info_types { # list
              name    = ""     # string | required | Name of the information type.
              version = ""     # string | optional | Version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

            primitive_transformation { # list [1..1]

              bucketing_config { # list [0..1]

                buckets { # list [1..*]

                  max { # list [0..1]
                    day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                    float_value       = 0      # number | optional | A float value.
                    integer_value     = ""     # string | optional | An integer value (int64 format)
                    string_value      = ""     # string | optional | A string value.
                    timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                    date_value { # list [0..1]
                      day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                      month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                      year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                    }

                    time_value { # list [0..1]
                      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                    }

                  }

                  min { # list [0..1]
                    day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                    float_value       = 0      # number | optional | A float value.
                    integer_value     = ""     # string | optional | An integer value (int64 format)
                    string_value      = ""     # string | optional | A string value.
                    timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                    date_value { # list [0..1]
                      day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                      month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                      year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                    }

                    time_value { # list [0..1]
                      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                    }

                  }

                  replacement_value { # list [1..1]
                    day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                    float_value       = 0      # number | optional | A float value.
                    integer_value     = ""     # string | optional | An integer value (int64 format)
                    string_value      = ""     # string | optional | A string value.
                    timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                    date_value { # list [0..1]
                      day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                      month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                      year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                    }

                    time_value { # list [0..1]
                      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                    }

                  }

                }

              }

              character_mask_config { # list [0..1]
                masking_character = ""     # string | optional | Character to use to mask the sensitive values—for example, *…
                number_to_mask    = 0      # number | optional | Number of characters to mask. If not set, all matching chars…
                reverse_order     = false  # bool | optional | Mask characters in reverse order. For example, if masking_ch…

                characters_to_ignore { # list
                  characters_to_skip          = ""     # string | optional | Characters to not transform when masking. Only one of this o…
                  common_characters_to_ignore = ""     # string | optional | Common characters to not transform when masking. Useful to a…

                }

              }

              crypto_deterministic_config { # list [0..1]

                context { # list [0..1]
                  name = ""     # string | required | Name describing the field.

                }

                crypto_key { # list [1..1]

                  kms_wrapped { # list [0..1]
                    crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                    wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

                  }

                  transient { # list [0..1]
                    name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

                  }

                  unwrapped { # list [0..1]
                    key = ""     # string | required+sensitive | A 128/192/256 bit key.  A base64-encoded string.

                  }

                }

                surrogate_info_type { # list [1..1]
                  name    = ""     # string | required | Name of the information type. Either a name of your choosing…
                  version = ""     # string | optional | Optional version name for this InfoType.

                  sensitivity_score { # list [0..1]
                    score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

                  }

                }

              }

              crypto_hash_config { # list [0..1]

                crypto_key { # list [1..1]

                  kms_wrapped { # list [0..1]
                    crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                    wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

                  }

                  transient { # list [0..1]
                    name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

                  }

                  unwrapped { # list [0..1]
                    key = ""     # string | required+sensitive | A 128/192/256 bit key.  A base64-encoded string.

                  }

                }

              }

              crypto_replace_ffx_fpe_config { # list [0..1]
                common_alphabet = ""     # string | optional | Common alphabets. Only one of this, 'custom_alphabet' or 'ra…
                custom_alphabet = ""     # string | optional | This is supported by mapping these to the alphanumeric chara…
                radix           = 0      # number | optional | The native way to select the alphabet. Must be in the range …

                context { # list [0..1]
                  name = ""     # string | required | Name describing the field.

                }

                crypto_key { # list [1..1]

                  kms_wrapped { # list [0..1]
                    crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                    wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

                  }

                  transient { # list [0..1]
                    name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

                  }

                  unwrapped { # list [0..1]
                    key = ""     # string | required+sensitive | A 128/192/256 bit key.  A base64-encoded string.

                  }

                }

                surrogate_info_type { # list [0..1]
                  name    = ""     # string | required | Name of the information type. Either a name of your choosing…
                  version = ""     # string | optional | Optional version name for this InfoType.

                  sensitivity_score { # list [0..1]
                    score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

                  }

                }

              }

              date_shift_config { # list [0..1]
                lower_bound_days = 0      # number | required | For example, -5 means shift date to at most 5 days back in t…
                upper_bound_days = 0      # number | required | Range of shift in days. Actual shift will be selected at ran…

                context { # list [0..1]
                  name = ""     # string | required | Name describing the field.

                }

                crypto_key { # list [0..1]

                  kms_wrapped { # list [0..1]
                    crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                    wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

                  }

                  transient { # list [0..1]
                    name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

                  }

                  unwrapped { # list [0..1]
                    key = ""     # string | required+sensitive | A 128/192/256 bit key.  A base64-encoded string.

                  }

                }

              }

              fixed_size_bucketing_config { # list [0..1]
                bucket_size = 0      # number | required | Size of each bucket (except for minimum and maximum buckets)…

                lower_bound { # list [1..1]
                  float_value   = 0      # number | optional | A float value.
                  integer_value = ""     # string | optional | An integer value (int64 format)

                }

                upper_bound { # list [1..1]
                  float_value   = 0      # number | optional | A float value.
                  integer_value = ""     # string | optional | An integer value (int64 format)

                }

              }

              redact_config {} # list [0..1]

              replace_config { # list [0..1]

                new_value { # list [1..1]
                  boolean_value     = false  # bool | optional | A boolean value.
                  day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                  float_value       = 0      # number | optional | A float value.
                  integer_value     = ""     # string | optional | An integer value (int64 format)
                  string_value      = ""     # string | optional | A string value.
                  timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                  date_value { # list [0..1]
                    day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                    month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                    year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                  }

                  time_value { # list [0..1]
                    hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                    minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                    nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                    seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                  }

                }

              }

              replace_dictionary_config { # list [0..1]

                word_list { # list [1..1]
                  words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

                }

              }

              replace_with_info_type_config {} # list [0..1]

              time_part_config { # list [0..1]
                part_to_extract = ""     # string | required | The part of the time to keep. Possible values: ["YEAR", "MON…

              }

            }

          }

        }

        primitive_transformation { # list [0..1]

          bucketing_config { # list [0..1]

            buckets { # list

              max { # list [0..1]
                boolean_value     = false  # bool | optional | A boolean value.
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

              min { # list [0..1]
                boolean_value     = false  # bool | optional | A boolean value.
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

              replacement_value { # list [1..1]
                boolean_value     = false  # bool | optional | A boolean value.
                day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                float_value       = 0      # number | optional | A float value.
                integer_value     = ""     # string | optional | An integer value (int64 format)
                string_value      = ""     # string | optional | A string value.
                timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                date_value { # list [0..1]
                  day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                  month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                  year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                }

                time_value { # list [0..1]
                  hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                  minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                  nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                  seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                }

              }

            }

          }

          character_mask_config { # list [0..1]
            masking_character = ""     # string | optional | Character to use to mask the sensitive values—for example, *…
            number_to_mask    = 0      # number | optional | Number of characters to mask. If not set, all matching chars…
            reverse_order     = false  # bool | optional | Mask characters in reverse order. For example, if masking_ch…

            characters_to_ignore { # list
              characters_to_skip          = ""     # string | optional | Characters to not transform when masking.
              common_characters_to_ignore = ""     # string | optional | Common characters to not transform when masking. Useful to a…

            }

          }

          crypto_deterministic_config { # list [0..1]

            context { # list [0..1]
              name = ""     # string | optional | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

            surrogate_info_type { # list [0..1]
              name    = ""     # string | optional | Name of the information type. Either a name of your choosing…
              version = ""     # string | optional | Optional version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

          }

          crypto_hash_config { # list [0..1]

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

          }

          crypto_replace_ffx_fpe_config { # list [0..1]
            common_alphabet = ""     # string | optional | Common alphabets. Possible values: ["FFX_COMMON_NATIVE_ALPHA…
            custom_alphabet = ""     # string | optional | This is supported by mapping these to the alphanumeric chara…
            radix           = 0      # number | optional | The native way to select the alphabet. Must be in the range …

            context { # list [0..1]
              name = ""     # string | optional | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

            surrogate_info_type { # list [0..1]
              name    = ""     # string | optional | Name of the information type. Either a name of your choosing…
              version = ""     # string | optional | Optional version name for this InfoType.

              sensitivity_score { # list [0..1]
                score = ""     # string | required | The sensitivity score applied to the resource. Possible valu…

              }

            }

          }

          date_shift_config { # list [0..1]
            lower_bound_days = 0      # number | required | For example, -5 means shift date to at most 5 days back in t…
            upper_bound_days = 0      # number | required | Range of shift in days. Actual shift will be selected at ran…

            context { # list [0..1]
              name = ""     # string | optional | Name describing the field.

            }

            crypto_key { # list [0..1]

              kms_wrapped { # list [0..1]
                crypto_key_name = ""     # string | required | The resource name of the KMS CryptoKey to use for unwrapping…
                wrapped_key     = ""     # string | required | The wrapped data crypto key.  A base64-encoded string.

              }

              transient { # list [0..1]
                name = ""     # string | required | Name of the key. This is an arbitrary string used to differe…

              }

              unwrapped { # list [0..1]
                key = ""     # string | required | A 128/192/256 bit key.  A base64-encoded string.

              }

            }

          }

          fixed_size_bucketing_config { # list [0..1]
            bucket_size = 0      # number | required | Size of each bucket (except for minimum and maximum buckets)…

            lower_bound { # list [1..1]
              boolean_value     = false  # bool | optional | A boolean value.
              day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
              float_value       = 0      # number | optional | A float value.
              integer_value     = ""     # string | optional | An integer value (int64 format)
              string_value      = ""     # string | optional | A string value.
              timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

              date_value { # list [0..1]
                day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

              }

              time_value { # list [0..1]
                hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

              }

            }

            upper_bound { # list [1..1]
              boolean_value     = false  # bool | optional | A boolean value.
              day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
              float_value       = 0      # number | optional | A float value.
              integer_value     = ""     # string | optional | An integer value (int64 format)
              string_value      = ""     # string | optional | A string value.
              timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

              date_value { # list [0..1]
                day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

              }

              time_value { # list [0..1]
                hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

              }

            }

          }

          redact_config {} # list [0..1]

          replace_config { # list [0..1]

            new_value { # list [1..1]
              boolean_value     = false  # bool | optional | A boolean value.
              day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
              float_value       = 0      # number | optional | A float value.
              integer_value     = ""     # string | optional | An integer value (int64 format)
              string_value      = ""     # string | optional | A string value.
              timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

              date_value { # list [0..1]
                day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

              }

              time_value { # list [0..1]
                hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

              }

            }

          }

          replace_dictionary_config { # list [0..1]

            word_list { # list [0..1]
              words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

            }

          }

          time_part_config { # list [0..1]
            part_to_extract = ""     # string | optional | The part of the time to keep. Possible values: ["YEAR", "MON…

          }

        }

      }

      record_suppressions { # list

        condition { # list [0..1]

          expressions { # list [0..1]
            logical_operator = ""     # string | optional | The operator to apply to the result of conditions. Default a…

            conditions { # list [0..1]

              conditions { # list
                operator = ""     # string | required | Operator used to compare the field or infoType to the value.…

                field { # list [1..1]
                  name = ""     # string | optional | Name describing the field.

                }

                value { # list [0..1]
                  boolean_value     = false  # bool | optional | A boolean value.
                  day_of_week_value = ""     # string | optional | Represents a day of the week. Possible values: ["MONDAY", "T…
                  float_value       = 0      # number | optional | A float value.
                  integer_value     = ""     # string | optional | An integer value (int64 format)
                  string_value      = ""     # string | optional | A string value.
                  timestamp_value   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

                  date_value { # list [0..1]
                    day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
                    month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
                    year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

                  }

                  time_value { # list [0..1]
                    hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
                    minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
                    nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
                    seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

                  }

                }

              }

            }

          }

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

