# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_instance_type                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_instance_type" "this" {

  instance_type                        = ""     # string | required
  id                                   = ""     # string | optional+computed

  # auto_recovery_supported              = false  # bool | computed
  # bandwidth_weightings                 = []     # set(string) | computed
  # bare_metal                           = false  # bool | computed
  # boot_modes                           = []     # set(string) | computed
  # burstable_performance_supported      = false  # bool | computed
  # current_generation                   = false  # bool | computed
  # dedicated_hosts_supported            = false  # bool | computed
  # default_cores                        = 0      # number | computed
  # default_network_card_index           = 0      # number | computed
  # default_threads_per_core             = 0      # number | computed
  # default_vcpus                        = 0      # number | computed
  # ebs_encryption_support               = ""     # string | computed
  # ebs_nvme_support                     = ""     # string | computed
  # ebs_optimized_support                = ""     # string | computed
  # ebs_performance_baseline_bandwidth   = 0      # number | computed
  # ebs_performance_baseline_iops        = 0      # number | computed
  # ebs_performance_baseline_throughput  = 0      # number | computed
  # ebs_performance_maximum_bandwidth    = 0      # number | computed
  # ebs_performance_maximum_iops         = 0      # number | computed
  # ebs_performance_maximum_throughput   = 0      # number | computed
  # efa_maximum_interfaces               = 0      # number | computed
  # efa_supported                        = false  # bool | computed
  # ena_srd_supported                    = false  # bool | computed
  # ena_support                          = ""     # string | computed
  # encryption_in_transit_supported      = false  # bool | computed
  # fpgas = [  # set(object)
  #   {
  #     count = 0
  #     manufacturer = ""
  #     memory_size = 0
  #     name = ""
  #   }
  # ]
  # free_tier_eligible                   = false  # bool | computed
  # gpus = [  # set(object)
  #   {
  #     count = 0
  #     manufacturer = ""
  #     memory_size = 0
  #     name = ""
  #   }
  # ]
  # hibernation_supported                = false  # bool | computed
  # hypervisor                           = ""     # string | computed
  # inference_accelerators = [  # set(object)
  #   {
  #     count = 0
  #     manufacturer = ""
  #     memory_size = 0
  #     name = ""
  #   }
  # ]
  # instance_disks = [  # set(object)
  #   {
  #     count = 0
  #     size = 0
  #     type = ""
  #   }
  # ]
  # instance_storage_supported           = false  # bool | computed
  # ipv6_supported                       = false  # bool | computed
  # maximum_ipv4_addresses_per_interface = 0      # number | computed
  # maximum_ipv6_addresses_per_interface = 0      # number | computed
  # maximum_network_cards                = 0      # number | computed
  # maximum_network_interfaces           = 0      # number | computed
  # media_accelerators = [  # set(object)
  #   {
  #     count = 0
  #     manufacturer = ""
  #     memory_size = 0
  #     name = ""
  #   }
  # ]
  # memory_size                          = 0      # number | computed
  # network_cards = [  # set(object)
  #   {
  #     baseline_bandwidth = 0
  #     index = 0
  #     maximum_interfaces = 0
  #     peak_bandwidth = 0
  #     performance = ""
  #   }
  # ]
  # network_performance                  = ""     # string | computed
  # neuron_devices = [  # set(object)
  #   {
  #     core_count = 0
  #     core_version = 0
  #     count = 0
  #     memory_size = 0
  #     name = ""
  #   }
  # ]
  # nitro_enclaves_support               = ""     # string | computed
  # nitro_tpm_support                    = ""     # string | computed
  # nitro_tpm_supported_versions         = []     # set(string) | computed
  # phc_support                          = ""     # string | computed
  # supported_architectures              = []     # list(string) | computed
  # supported_cpu_features               = []     # set(string) | computed
  # supported_placement_strategies       = []     # list(string) | computed
  # supported_root_device_types          = []     # list(string) | computed
  # supported_usages_classes             = []     # list(string) | computed
  # supported_virtualization_types       = []     # list(string) | computed
  # sustained_clock_speed                = 0      # number | computed
  # total_fpga_memory                    = 0      # number | computed
  # total_gpu_memory                     = 0      # number | computed
  # total_inference_memory               = 0      # number | computed
  # total_instance_storage               = 0      # number | computed
  # total_media_memory                   = 0      # number | computed
  # total_neuron_device_memory           = 0      # number | computed
  # valid_cores                          = []     # list(number) | computed
  # valid_threads_per_core               = []     # list(number) | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

