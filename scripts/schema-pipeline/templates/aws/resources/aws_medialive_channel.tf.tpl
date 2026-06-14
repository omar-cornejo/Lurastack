# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_medialive_channel                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_medialive_channel" "this" {

  channel_class = ""     # string | required
  name          = ""     # string | required
  id            = ""     # string | optional+computed
  log_level     = ""     # string | optional+computed
  role_arn      = ""     # string | optional
  start_channel = false  # bool | optional
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # channel_id    = ""     # string | computed

  cdi_input_specification { # list [0..1]
    resolution = ""     # string | required

  }

  destinations { # set [1..*]
    id = ""     # string | required

    media_package_settings { # set
      channel_id = ""     # string | required

    }

    multiplex_settings { # list [0..1]
      multiplex_id = ""     # string | required
      program_name = ""     # string | required

    }

    settings { # set
      password_param = ""     # string | optional
      stream_name    = ""     # string | optional
      url            = ""     # string | optional
      username       = ""     # string | optional

    }

  }

  encoder_settings { # list [1..1]

    audio_descriptions { # set
      audio_selector_name   = ""     # string | required
      name                  = ""     # string | required
      audio_type            = ""     # string | optional+computed
      audio_type_control    = ""     # string | optional+computed
      language_code         = ""     # string | optional+computed
      language_code_control = ""     # string | optional+computed
      stream_name           = ""     # string | optional+computed

      audio_normalization_settings { # list [0..1]
        algorithm         = ""     # string | optional+computed
        algorithm_control = ""     # string | optional+computed
        target_lkfs       = 0      # number | optional+computed

      }

      audio_watermark_settings { # list [0..1]

        nielsen_watermarks_settings { # list [0..1]
          nielsen_distribution_type = ""     # string | optional+computed

          nielsen_cbet_settings { # list [0..1]
            cbet_check_digit_string = ""     # string | required
            cbet_stepaside          = ""     # string | required
            csid                    = ""     # string | required

          }

          nielsen_naes_ii_nw_settings { # list
            check_digit_string = ""     # string | required
            sid                = 0      # number | required

          }

        }

      }

      codec_settings { # list [0..1]

        aac_settings { # list [0..1]
          bitrate           = 0      # number | optional+computed
          coding_mode       = ""     # string | optional+computed
          input_type        = ""     # string | optional+computed
          profile           = ""     # string | optional+computed
          rate_control_mode = ""     # string | optional+computed
          raw_format        = ""     # string | optional+computed
          sample_rate       = 0      # number | optional+computed
          spec              = ""     # string | optional+computed
          vbr_quality       = ""     # string | optional+computed

        }

        ac3_settings { # list [0..1]
          bitrate          = 0      # number | optional+computed
          bitstream_mode   = ""     # string | optional+computed
          coding_mode      = ""     # string | optional+computed
          dialnorm         = 0      # number | optional+computed
          drc_profile      = ""     # string | optional+computed
          lfe_filter       = ""     # string | optional+computed
          metadata_control = ""     # string | optional+computed

        }

        eac3_atmos_settings { # list [0..1]
          bitrate       = 0      # number | optional+computed
          coding_mode   = ""     # string | optional+computed
          dialnorm      = 0      # number | optional+computed
          drc_line      = ""     # string | optional+computed
          drc_rf        = ""     # string | optional+computed
          height_trim   = 0      # number | optional+computed
          surround_trim = 0      # number | optional+computed

        }

        eac3_settings { # list [0..1]
          attenuation_control      = ""     # string | optional+computed
          bitrate                  = 0      # number | optional+computed
          bitstream_mode           = ""     # string | optional+computed
          coding_mode              = ""     # string | optional+computed
          dc_filter                = ""     # string | optional+computed
          dialnorm                 = 0      # number | optional+computed
          drc_line                 = ""     # string | optional+computed
          drc_rf                   = ""     # string | optional+computed
          lfe_control              = ""     # string | optional+computed
          lfe_filter               = ""     # string | optional+computed
          lo_ro_center_mix_level   = 0      # number | optional+computed
          lo_ro_surround_mix_level = 0      # number | optional+computed
          lt_rt_center_mix_level   = 0      # number | optional+computed
          lt_rt_surround_mix_level = 0      # number | optional+computed
          metadata_control         = ""     # string | optional+computed
          passthrough_control      = ""     # string | optional+computed
          phase_control            = ""     # string | optional+computed
          stereo_downmix           = ""     # string | optional+computed
          surround_ex_mode         = ""     # string | optional+computed
          surround_mode            = ""     # string | optional+computed

        }

        mp2_settings { # list [0..1]
          bitrate     = 0      # number | optional+computed
          coding_mode = ""     # string | optional+computed
          sample_rate = 0      # number | optional+computed

        }

        pass_through_settings {} # list [0..1]

        wav_settings { # list [0..1]
          bit_depth   = 0      # number | optional+computed
          coding_mode = ""     # string | optional+computed
          sample_rate = 0      # number | optional+computed

        }

      }

      remix_settings { # list [0..1]
        channels_in  = 0      # number | optional+computed
        channels_out = 0      # number | optional+computed

        channel_mappings { # set [1..*]
          output_channel = 0      # number | required

          input_channel_levels { # set [1..*]
            gain          = 0      # number | required
            input_channel = 0      # number | required

          }

        }

      }

    }

    avail_blanking { # list [0..1]
      state = ""     # string | optional+computed

      avail_blanking_image { # list [0..1]
        uri            = ""     # string | required
        password_param = ""     # string | optional+computed
        username       = ""     # string | optional+computed

      }

    }

    caption_descriptions { # list
      caption_selector_name = ""     # string | required
      name                  = ""     # string | required
      accessibility         = ""     # string | optional
      language_code         = ""     # string | optional
      language_description  = ""     # string | optional

      destination_settings { # list [0..1]

        arib_destination_settings {} # list [0..1]

        burn_in_destination_settings { # list [0..1]
          outline_color         = ""     # string | required
          teletext_grid_control = ""     # string | required
          alignment             = ""     # string | optional
          background_color      = ""     # string | optional
          background_opacity    = 0      # number | optional
          font_color            = ""     # string | optional
          font_opacity          = 0      # number | optional
          font_resolution       = 0      # number | optional
          font_size             = ""     # string | optional
          outline_size          = 0      # number | optional
          shadow_color          = ""     # string | optional
          shadow_opacity        = 0      # number | optional
          shadow_x_offset       = 0      # number | optional
          shadow_y_offset       = 0      # number | optional
          x_position            = 0      # number | optional
          y_position            = 0      # number | optional

          font { # list [0..1]
            uri            = ""     # string | required
            password_param = ""     # string | optional+computed
            username       = ""     # string | optional+computed

          }

        }

        dvb_sub_destination_settings { # list [0..1]
          alignment             = ""     # string | optional
          background_color      = ""     # string | optional
          background_opacity    = 0      # number | optional
          font_color            = ""     # string | optional
          font_opacity          = 0      # number | optional
          font_resolution       = 0      # number | optional
          font_size             = ""     # string | optional+computed
          outline_color         = ""     # string | optional
          outline_size          = 0      # number | optional
          shadow_color          = ""     # string | optional
          shadow_opacity        = 0      # number | optional
          shadow_x_offset       = 0      # number | optional
          shadow_y_offset       = 0      # number | optional
          teletext_grid_control = ""     # string | optional
          x_position            = 0      # number | optional
          y_position            = 0      # number | optional

          font { # list [0..1]
            uri            = ""     # string | required
            password_param = ""     # string | optional+computed
            username       = ""     # string | optional+computed

          }

        }

        ebu_tt_d_destination_settings { # list [0..1]
          copyright_holder = ""     # string | optional
          fill_line_gap    = ""     # string | optional
          font_family      = ""     # string | optional
          style_control    = ""     # string | optional+computed

        }

        embedded_destination_settings {} # list [0..1]

        embedded_plus_scte20_destination_settings {} # list [0..1]

        rtmp_caption_info_destination_settings {} # list [0..1]

        scte20_plus_embedded_destination_settings {} # list [0..1]

        scte27_destination_settings {} # list [0..1]

        smpte_tt_destination_settings {} # list [0..1]

        teletext_destination_settings {} # list [0..1]

        ttml_destination_settings { # list [0..1]
          style_control = ""     # string | required

        }

        webvtt_destination_settings { # list [0..1]
          style_control = ""     # string | required

        }

      }

    }

    global_configuration { # list [0..1]
      initial_audio_gain           = 0      # number | optional
      input_end_action             = ""     # string | optional
      output_locking_mode          = ""     # string | optional
      output_timing_source         = ""     # string | optional
      support_low_framerate_inputs = ""     # string | optional

      input_loss_behavior { # list [0..1]
        black_frame_msec       = 0      # number | optional
        input_loss_image_color = ""     # string | optional
        input_loss_image_type  = ""     # string | optional
        repeat_frame_msec      = 0      # number | optional

        input_loss_image_slate { # list [0..1]
          uri            = ""     # string | required
          password_param = ""     # string | optional+computed
          username       = ""     # string | optional+computed

        }

      }

    }

    motion_graphics_configuration { # list [0..1]
      motion_graphics_insertion = ""     # string | optional

      motion_graphics_settings { # list [1..1]

        html_motion_graphics_settings {} # list [0..1]

      }

    }

    nielsen_configuration { # list [0..1]
      distributor_id             = ""     # string | optional
      nielsen_pcm_to_id3_tagging = ""     # string | optional

    }

    output_groups { # list [1..*]
      name = ""     # string | optional

      output_group_settings { # list [1..1]

        archive_group_settings { # list
          rollover_interval = 0      # number | optional

          archive_cdn_settings { # list [0..1]

            archive_s3_settings { # list [0..1]
              canned_acl = ""     # string | optional

            }

          }

          destination { # list [1..1]
            destination_ref_id = ""     # string | required

          }

        }

        frame_capture_group_settings { # list [0..1]

          destination { # list [1..1]
            destination_ref_id = ""     # string | required

          }

          frame_capture_cdn_settings { # list [0..1]

            frame_capture_s3_settings { # list [0..1]
              canned_acl = ""     # string | optional

            }

          }

        }

        hls_group_settings { # list [0..1]
          ad_markers                   = []     # list(string) | optional+computed
          base_url_content             = ""     # string | optional+computed
          base_url_content1            = ""     # string | optional+computed
          base_url_manifest            = ""     # string | optional+computed
          base_url_manifest1           = ""     # string | optional+computed
          caption_language_setting     = ""     # string | optional+computed
          client_cache                 = ""     # string | optional+computed
          codec_specification          = ""     # string | optional+computed
          constant_iv                  = ""     # string | optional+computed
          directory_structure          = ""     # string | optional+computed
          discontinuity_tags           = ""     # string | optional+computed
          encryption_type              = ""     # string | optional+computed
          hls_id3_segment_tagging      = ""     # string | optional+computed
          iframe_only_playlists        = ""     # string | optional+computed
          incomplete_segment_behavior  = ""     # string | optional+computed
          index_n_segments             = 0      # number | optional+computed
          input_loss_action            = ""     # string | optional+computed
          iv_in_manifest               = ""     # string | optional+computed
          iv_source                    = ""     # string | optional+computed
          keep_segments                = 0      # number | optional+computed
          key_format                   = ""     # string | optional+computed
          key_format_versions          = ""     # string | optional+computed
          manifest_compression         = ""     # string | optional+computed
          manifest_duration_format     = ""     # string | optional+computed
          min_segment_length           = 0      # number | optional+computed
          mode                         = ""     # string | optional+computed
          output_selection             = ""     # string | optional+computed
          program_date_time            = ""     # string | optional+computed
          program_date_time_clock      = ""     # string | optional+computed
          program_date_time_period     = 0      # number | optional+computed
          redundant_manifest           = ""     # string | optional+computed
          segment_length               = 0      # number | optional+computed
          segments_per_subdirectory    = 0      # number | optional+computed
          stream_inf_resolution        = ""     # string | optional+computed
          timed_metadata_id3_frame     = ""     # string | optional+computed
          timed_metadata_id3_period    = 0      # number | optional+computed
          timestamp_delta_milliseconds = 0      # number | optional+computed
          ts_file_mode                 = ""     # string | optional+computed

          caption_language_mappings { # set [0..4]
            caption_channel      = 0      # number | required
            language_code        = ""     # string | required
            language_description = ""     # string | required

          }

          destination { # list [1..1]
            destination_ref_id = ""     # string | required

          }

          hls_cdn_settings { # list

            hls_akamai_settings { # list [0..1]
              connection_retry_interval = 0      # number | optional
              filecache_duration        = 0      # number | optional
              http_transfer_mode        = ""     # string | optional+computed
              num_retries               = 0      # number | optional
              restart_delay             = 0      # number | optional
              salt                      = ""     # string | optional+computed
              token                     = ""     # string | optional+computed

            }

            hls_basic_put_settings { # list [0..1]
              connection_retry_interval = 0      # number | optional
              filecache_duration        = 0      # number | optional
              num_retries               = 0      # number | optional
              restart_delay             = 0      # number | optional

            }

            hls_media_store_settings { # list [0..1]
              connection_retry_interval = 0      # number | optional
              filecache_duration        = 0      # number | optional
              media_store_storage_class = ""     # string | optional+computed
              num_retries               = 0      # number | optional
              restart_delay             = 0      # number | optional

            }

            hls_s3_settings { # list [0..1]
              canned_acl = ""     # string | optional

            }

            hls_webdav_settings { # list [0..1]
              connection_retry_interval = 0      # number | optional
              filecache_duration        = 0      # number | optional
              http_transfer_mode        = ""     # string | optional+computed
              num_retries               = 0      # number | optional
              restart_delay             = 0      # number | optional

            }

          }

          key_provider_settings { # list [0..1]

            static_key_settings { # list
              static_key_value = ""     # string | required

              key_provider_server { # list [0..1]
                uri            = ""     # string | required
                password_param = ""     # string | optional+computed
                username       = ""     # string | optional+computed

              }

            }

          }

        }

        media_package_group_settings { # list [0..1]

          destination { # list [1..1]
            destination_ref_id = ""     # string | required

          }

        }

        ms_smooth_group_settings { # list [0..1]
          acquisition_point_id        = ""     # string | optional+computed
          audio_only_timecode_control = ""     # string | optional+computed
          certificate_mode            = ""     # string | optional+computed
          connection_retry_interval   = 0      # number | optional+computed
          event_id                    = ""     # string | optional+computed
          event_id_mode               = ""     # string | optional+computed
          event_stop_behavior         = ""     # string | optional+computed
          filecache_duration          = 0      # number | optional
          fragment_length             = 0      # number | optional+computed
          input_loss_action           = ""     # string | optional+computed
          num_retries                 = 0      # number | optional
          restart_delay               = 0      # number | optional
          segmentation_mode           = ""     # string | optional+computed
          send_delay_ms               = 0      # number | optional+computed
          sparse_track_type           = ""     # string | optional+computed
          stream_manifest_behavior    = ""     # string | optional+computed
          timestamp_offset            = ""     # string | optional+computed
          timestamp_offset_mode       = ""     # string | optional+computed

          destination { # list [1..1]
            destination_ref_id = ""     # string | required

          }

        }

        multiplex_group_settings {} # list [0..1]

        rtmp_group_settings { # list [0..1]
          ad_markers            = []     # list(string) | optional
          authentication_scheme = ""     # string | optional+computed
          cache_full_behavior   = ""     # string | optional+computed
          cache_length          = 0      # number | optional+computed
          caption_data          = ""     # string | optional+computed
          input_loss_action     = ""     # string | optional+computed
          restart_delay         = 0      # number | optional

        }

        udp_group_settings { # list [0..1]
          input_loss_action         = ""     # string | optional+computed
          timed_metadata_id3_frame  = ""     # string | optional+computed
          timed_metadata_id3_period = 0      # number | optional+computed

        }

      }

      outputs { # list [1..*]
        audio_description_names   = []     # set(string) | optional
        caption_description_names = []     # set(string) | optional+computed
        output_name               = ""     # string | optional
        video_description_name    = ""     # string | optional

        output_settings { # list [1..1]

          archive_output_settings { # list [0..1]
            extension     = ""     # string | optional
            name_modifier = ""     # string | optional

            container_settings { # list [0..1]

              m2ts_settings { # list [0..1]
                absent_input_audio_behavior = ""     # string | optional+computed
                arib                        = ""     # string | optional
                arib_captions_pid           = ""     # string | optional+computed
                arib_captions_pid_control   = ""     # string | optional
                audio_buffer_model          = ""     # string | optional
                audio_frames_per_pes        = 0      # number | optional
                audio_pids                  = ""     # string | optional+computed
                audio_stream_type           = ""     # string | optional
                bitrate                     = 0      # number | optional
                buffer_model                = ""     # string | optional
                cc_descriptor               = ""     # string | optional
                dvb_sub_pids                = ""     # string | optional+computed
                dvb_teletext_pid            = ""     # string | optional+computed
                ebif                        = ""     # string | optional
                ebp_audio_interval          = ""     # string | optional
                ebp_lookahead_ms            = 0      # number | optional
                ebp_placement               = ""     # string | optional
                ecm_pid                     = ""     # string | optional
                es_rate_in_pes              = ""     # string | optional
                etv_platform_pid            = ""     # string | optional+computed
                etv_signal_pid              = ""     # string | optional+computed
                fragment_time               = 0      # number | optional
                klv                         = ""     # string | optional
                klv_data_pids               = ""     # string | optional+computed
                nielsen_id3_behavior        = ""     # string | optional
                null_packet_bitrate         = 0      # number | optional
                pat_interval                = 0      # number | optional
                pcr_control                 = ""     # string | optional
                pcr_period                  = 0      # number | optional
                pcr_pid                     = ""     # string | optional
                pmt_interval                = 0      # number | optional
                pmt_pid                     = ""     # string | optional+computed
                program_num                 = 0      # number | optional
                rate_mode                   = ""     # string | optional
                scte27_pids                 = ""     # string | optional+computed
                scte35_control              = ""     # string | optional
                scte35_pid                  = ""     # string | optional+computed
                segmentation_markers        = ""     # string | optional
                segmentation_style          = ""     # string | optional
                segmentation_time           = 0      # number | optional
                timed_metadata_behavior     = ""     # string | optional
                timed_metadata_pid          = ""     # string | optional+computed
                transport_stream_id         = 0      # number | optional
                video_pid                   = ""     # string | optional+computed

                dvb_nit_settings { # list [0..1]
                  network_id   = 0      # number | required
                  network_name = ""     # string | required
                  rep_interval = 0      # number | optional

                }

                dvb_sdt_settings { # list [0..1]
                  output_sdt            = ""     # string | optional
                  rep_interval          = 0      # number | optional
                  service_name          = ""     # string | optional
                  service_provider_name = ""     # string | optional

                }

                dvb_tdt_settings { # list [0..1]
                  rep_interval = 0      # number | optional

                }

              }

              raw_settings {} # list [0..1]

            }

          }

          frame_capture_output_settings { # list [0..1]
            name_modifier = ""     # string | optional+computed

          }

          hls_output_settings { # list [0..1]
            h265_packaging_type = ""     # string | optional+computed
            name_modifier       = ""     # string | optional+computed
            segment_modifier    = ""     # string | optional+computed

            hls_settings { # list [1..1]

              audio_only_hls_settings { # list [0..1]
                audio_group_id   = ""     # string | optional+computed
                audio_track_type = ""     # string | optional+computed
                segment_type     = ""     # string | optional+computed

                audio_only_image { # list [0..1]
                  uri            = ""     # string | required
                  password_param = ""     # string | optional+computed
                  username       = ""     # string | optional+computed

                }

              }

              fmp4_hls_settings { # list [0..1]
                audio_rendition_sets    = ""     # string | optional+computed
                nielsen_id3_behavior    = ""     # string | optional+computed
                timed_metadata_behavior = ""     # string | optional+computed

              }

              frame_capture_hls_settings {} # list [0..1]

              standard_hls_settings { # list [0..1]
                audio_rendition_sets = ""     # string | optional+computed

                m3u8_settings { # list [1..1]
                  audio_frames_per_pes    = 0      # number | optional+computed
                  audio_pids              = ""     # string | optional+computed
                  ecm_pid                 = ""     # string | optional+computed
                  nielsen_id3_behavior    = ""     # string | optional+computed
                  pat_interval            = 0      # number | optional+computed
                  pcr_control             = ""     # string | optional+computed
                  pcr_period              = 0      # number | optional+computed
                  pcr_pid                 = ""     # string | optional+computed
                  pmt_interval            = 0      # number | optional+computed
                  pmt_pid                 = ""     # string | optional+computed
                  program_num             = 0      # number | optional+computed
                  scte35_behavior         = ""     # string | optional+computed
                  scte35_pid              = ""     # string | optional+computed
                  timed_metadata_behavior = ""     # string | optional+computed
                  timed_metadata_pid      = ""     # string | optional+computed
                  transport_stream_id     = 0      # number | optional+computed
                  video_pid               = ""     # string | optional+computed

                }

              }

            }

          }

          media_package_output_settings {} # list [0..1]

          ms_smooth_output_settings { # list [0..1]
            h265_packaging_type = ""     # string | optional+computed
            name_modifier       = ""     # string | optional+computed

          }

          multiplex_output_settings { # list [0..1]

            destination { # list [1..1]
              destination_ref_id = ""     # string | required

            }

          }

          rtmp_output_settings { # list [0..1]
            certificate_mode          = ""     # string | optional+computed
            connection_retry_interval = 0      # number | optional+computed
            num_retries               = 0      # number | optional+computed

            destination { # list [1..1]
              destination_ref_id = ""     # string | required

            }

          }

          udp_output_settings { # list [0..1]
            buffer_msec = 0      # number | optional+computed

            container_settings { # list [1..1]

              m2ts_settings { # list [0..1]
                absent_input_audio_behavior = ""     # string | optional+computed
                arib                        = ""     # string | optional
                arib_captions_pid           = ""     # string | optional+computed
                arib_captions_pid_control   = ""     # string | optional
                audio_buffer_model          = ""     # string | optional
                audio_frames_per_pes        = 0      # number | optional
                audio_pids                  = ""     # string | optional+computed
                audio_stream_type           = ""     # string | optional
                bitrate                     = 0      # number | optional
                buffer_model                = ""     # string | optional
                cc_descriptor               = ""     # string | optional
                dvb_sub_pids                = ""     # string | optional+computed
                dvb_teletext_pid            = ""     # string | optional+computed
                ebif                        = ""     # string | optional
                ebp_audio_interval          = ""     # string | optional
                ebp_lookahead_ms            = 0      # number | optional
                ebp_placement               = ""     # string | optional
                ecm_pid                     = ""     # string | optional
                es_rate_in_pes              = ""     # string | optional
                etv_platform_pid            = ""     # string | optional+computed
                etv_signal_pid              = ""     # string | optional+computed
                fragment_time               = 0      # number | optional
                klv                         = ""     # string | optional
                klv_data_pids               = ""     # string | optional+computed
                nielsen_id3_behavior        = ""     # string | optional
                null_packet_bitrate         = 0      # number | optional
                pat_interval                = 0      # number | optional
                pcr_control                 = ""     # string | optional
                pcr_period                  = 0      # number | optional
                pcr_pid                     = ""     # string | optional
                pmt_interval                = 0      # number | optional
                pmt_pid                     = ""     # string | optional+computed
                program_num                 = 0      # number | optional
                rate_mode                   = ""     # string | optional
                scte27_pids                 = ""     # string | optional+computed
                scte35_control              = ""     # string | optional
                scte35_pid                  = ""     # string | optional+computed
                segmentation_markers        = ""     # string | optional
                segmentation_style          = ""     # string | optional
                segmentation_time           = 0      # number | optional
                timed_metadata_behavior     = ""     # string | optional
                timed_metadata_pid          = ""     # string | optional+computed
                transport_stream_id         = 0      # number | optional
                video_pid                   = ""     # string | optional+computed

                dvb_nit_settings { # list [0..1]
                  network_id   = 0      # number | required
                  network_name = ""     # string | required
                  rep_interval = 0      # number | optional

                }

                dvb_sdt_settings { # list [0..1]
                  output_sdt            = ""     # string | optional
                  rep_interval          = 0      # number | optional
                  service_name          = ""     # string | optional
                  service_provider_name = ""     # string | optional

                }

                dvb_tdt_settings { # list [0..1]
                  rep_interval = 0      # number | optional

                }

              }

            }

            destination { # list [1..1]
              destination_ref_id = ""     # string | required

            }

            fec_output_settings { # list [0..1]
              column_depth = 0      # number | optional+computed
              include_fec  = ""     # string | optional+computed
              row_length   = 0      # number | optional+computed

            }

          }

        }

      }

    }

    timecode_config { # list [1..1]
      source         = ""     # string | required
      sync_threshold = 0      # number | optional+computed

    }

    video_descriptions { # list
      name             = ""     # string | required
      height           = 0      # number | optional+computed
      respond_to_afd   = ""     # string | optional+computed
      scaling_behavior = ""     # string | optional+computed
      sharpness        = 0      # number | optional+computed
      width            = 0      # number | optional+computed

      codec_settings { # list [0..1]

        frame_capture_settings { # list [0..1]
          capture_interval       = 0      # number | optional+computed
          capture_interval_units = ""     # string | optional+computed

        }

        h264_settings { # list [0..1]
          adaptive_quantization   = ""     # string | optional+computed
          afd_signaling           = ""     # string | optional+computed
          bitrate                 = 0      # number | optional+computed
          buf_fill_pct            = 0      # number | optional+computed
          buf_size                = 0      # number | optional+computed
          color_metadata          = ""     # string | optional+computed
          entropy_encoding        = ""     # string | optional+computed
          fixed_afd               = ""     # string | optional+computed
          flicker_aq              = ""     # string | optional+computed
          force_field_pictures    = ""     # string | optional+computed
          framerate_control       = ""     # string | optional+computed
          framerate_denominator   = 0      # number | optional+computed
          framerate_numerator     = 0      # number | optional+computed
          gop_b_reference         = ""     # string | optional+computed
          gop_closed_cadence      = 0      # number | optional+computed
          gop_num_b_frames        = 0      # number | optional+computed
          gop_size                = 0      # number | optional+computed
          gop_size_units          = ""     # string | optional+computed
          level                   = ""     # string | optional+computed
          look_ahead_rate_control = ""     # string | optional+computed
          max_bitrate             = 0      # number | optional+computed
          min_i_interval          = 0      # number | optional+computed
          num_ref_frames          = 0      # number | optional+computed
          par_control             = ""     # string | optional+computed
          par_denominator         = 0      # number | optional+computed
          par_numerator           = 0      # number | optional+computed
          profile                 = ""     # string | optional+computed
          quality_level           = ""     # string | optional+computed
          qvbr_quality_level      = 0      # number | optional+computed
          rate_control_mode       = ""     # string | optional+computed
          scan_type               = ""     # string | optional+computed
          scene_change_detect     = ""     # string | optional+computed
          slices                  = 0      # number | optional+computed
          softness                = 0      # number | optional+computed
          spatial_aq              = ""     # string | optional+computed
          subgop_length           = ""     # string | optional+computed
          syntax                  = ""     # string | optional+computed
          temporal_aq             = ""     # string | optional+computed
          timecode_insertion      = ""     # string | optional+computed

          filter_settings { # list [0..1]

            temporal_filter_settings { # list [0..1]
              post_filter_sharpening = ""     # string | optional
              strength               = ""     # string | optional

            }

          }

        }

        h265_settings { # list [0..1]
          bitrate                       = 0      # number | required
          framerate_denominator         = 0      # number | required
          framerate_numerator           = 0      # number | required
          adaptive_quantization         = ""     # string | optional+computed
          afd_signaling                 = ""     # string | optional+computed
          alternative_transfer_function = ""     # string | optional+computed
          buf_size                      = 0      # number | optional
          color_metadata                = ""     # string | optional+computed
          fixed_afd                     = ""     # string | optional+computed
          flicker_aq                    = ""     # string | optional+computed
          gop_closed_cadence            = 0      # number | optional
          gop_size                      = 0      # number | optional
          gop_size_units                = ""     # string | optional+computed
          level                         = ""     # string | optional+computed
          look_ahead_rate_control       = ""     # string | optional+computed
          max_bitrate                   = 0      # number | optional
          min_i_interval                = 0      # number | optional
          min_qp                        = 0      # number | optional
          mv_over_picture_boundaries    = ""     # string | optional+computed
          mv_temporal_predictor         = ""     # string | optional+computed
          par_denominator               = 0      # number | optional
          par_numerator                 = 0      # number | optional
          profile                       = ""     # string | optional+computed
          qvbr_quality_level            = 0      # number | optional
          rate_control_mode             = ""     # string | optional+computed
          scan_type                     = ""     # string | optional+computed
          scene_change_detect           = ""     # string | optional+computed
          slices                        = 0      # number | optional
          tier                          = ""     # string | optional+computed
          tile_height                   = 0      # number | optional
          tile_padding                  = ""     # string | optional+computed
          tile_width                    = 0      # number | optional
          timecode_insertion            = ""     # string | optional+computed
          treeblock_size                = ""     # string | optional+computed

          color_space_settings { # list [0..1]

            color_space_passthrough_settings {} # list [0..1]

            dolby_vision81_settings {} # list [0..1]

            hdr10_settings { # list [0..1]
              max_cll  = 0      # number | optional
              max_fall = 0      # number | optional

            }

            rec601_settings {} # list [0..1]

            rec709_settings {} # list [0..1]

          }

          filter_settings { # list [0..1]

            temporal_filter_settings { # list [0..1]
              post_filter_sharpening = ""     # string | optional
              strength               = ""     # string | optional

            }

          }

          timecode_burnin_settings { # list [0..1]
            prefix                    = ""     # string | optional+computed
            timecode_burnin_font_size = ""     # string | optional+computed
            timecode_burnin_position  = ""     # string | optional+computed

          }

        }

      }

    }

  }

  input_attachments { # set [1..*]
    input_attachment_name = ""     # string | required
    input_id              = ""     # string | required

    automatic_input_failover_settings { # list [0..1]
      secondary_input_id    = ""     # string | required
      error_clear_time_msec = 0      # number | optional
      input_preference      = ""     # string | optional

      failover_condition { # set

        failover_condition_settings { # list [0..1]

          audio_silence_settings { # list [0..1]
            audio_selector_name          = ""     # string | required
            audio_silence_threshold_msec = 0      # number | optional

          }

          input_loss_settings { # list [0..1]
            input_loss_threshold_msec = 0      # number | optional

          }

          video_black_settings { # list [0..1]
            black_detect_threshold     = 0      # number | optional
            video_black_threshold_msec = 0      # number | optional

          }

        }

      }

    }

    input_settings { # list [0..1]
      deblock_filter            = ""     # string | optional
      denoise_filter            = ""     # string | optional
      filter_strength           = 0      # number | optional
      input_filter              = ""     # string | optional+computed
      scte35_pid                = 0      # number | optional
      smpte2038_data_preference = ""     # string | optional
      source_end_behavior       = ""     # string | optional

      audio_selector { # list
        name = ""     # string | required

        selector_settings { # list [0..1]

          audio_hls_rendition_selection { # list [0..1]
            group_id = ""     # string | required
            name     = ""     # string | required

          }

          audio_language_selection { # list [0..1]
            language_code             = ""     # string | required
            language_selection_policy = ""     # string | optional

          }

          audio_pid_selection { # list [0..1]
            pid = 0      # number | required

          }

          audio_track_selection { # list [0..1]

            dolby_e_decode { # list [0..1]
              program_selection = ""     # string | required

            }

            tracks { # set [1..*]
              track = 0      # number | required

            }

          }

        }

      }

      caption_selector { # list
        name          = ""     # string | required
        language_code = ""     # string | optional

        selector_settings { # list [0..1]

          ancillary_source_settings { # list [0..1]
            source_ancillary_channel_number = 0      # number | optional

          }

          arib_source_settings {} # list [0..1]

          dvb_sub_source_settings { # list [0..1]
            ocr_language = ""     # string | optional
            pid          = 0      # number | optional

          }

          embedded_source_settings { # list [0..1]
            convert_608_to_708        = ""     # string | optional
            scte20_detection          = ""     # string | optional
            source_608_channel_number = 0      # number | optional

          }

          scte20_source_settings { # list [0..1]
            convert_608_to_708        = ""     # string | optional
            source_608_channel_number = 0      # number | optional

          }

          scte27_source_settings { # list [0..1]
            ocr_language = ""     # string | optional
            pid          = 0      # number | optional

          }

          teletext_source_settings { # list [0..1]
            page_number = ""     # string | optional

            output_rectangle { # list [0..1]
              height      = 0      # number | required
              left_offset = 0      # number | required
              top_offset  = 0      # number | required
              width       = 0      # number | required

            }

          }

        }

      }

      network_input_settings { # list [0..1]
        server_validation = ""     # string | optional

        hls_input_settings { # list [0..1]
          bandwidth       = 0      # number | optional
          buffer_segments = 0      # number | optional
          retries         = 0      # number | optional
          retry_interval  = 0      # number | optional
          scte35_source   = ""     # string | optional

        }

      }

      video_selector { # list [0..1]
        color_space       = ""     # string | optional
        color_space_usage = ""     # string | optional

      }

    }

  }

  input_specification { # list [1..1]
    codec            = ""     # string | required
    input_resolution = ""     # string | required
    maximum_bitrate  = ""     # string | required

  }

  maintenance { # list [0..1]
    maintenance_day        = ""     # string | required
    maintenance_start_time = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc { # list [0..1]
    public_address_allocation_ids = []     # list(string) | required
    subnet_ids                    = []     # set(string) | required
    security_group_ids            = []     # set(string) | optional+computed

    # availability_zones            = []     # set(string) | computed
    # network_interface_ids         = []     # set(string) | computed

  }

}

