# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_task                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_task" "this" {

  description      = ""     # string | optional | User-provided description of the task.
  display_name     = ""     # string | optional | User friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for the task.   **Note**: This field is …
  lake             = ""     # string | optional | The lake in which the task will be created in.
  location         = ""     # string | optional | The location in which the task will be created in.
  project          = ""     # string | optional+computed
  task_id          = ""     # string | optional | The task Id of the task.

  # create_time      = ""     # string | computed | The time when the task was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # execution_status = [  # list(object)
  #   {
  #     latest_job = [  # list(object)
  #       {
  #         end_time = ""
  #         message = ""
  #         name = ""
  #         retry_count = 0
  #         service = ""
  #         service_job = ""
  #         start_time = ""
  #         state = ""
  #         uid = ""
  #       }
  #     ]
  #     update_time = ""
  #   }
  # ]
  # name             = ""     # string | computed | The relative resource name of the task, of the form: project…
  # state            = ""     # string | computed | Current state of the task.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | System generated globally unique ID for the task. This ID wi…
  # update_time      = ""     # string | computed | The time when the task was last updated.

  execution_spec { # list [1..1]
    service_account            = ""     # string | required | Service account to use to execute a task. If not provided, t…
    args                       = {}     # map(string) | optional | The arguments to pass to the task. The args can use placehol…
    kms_key                    = ""     # string | optional | The Cloud KMS key to use for encryption, of the form: projec…
    max_job_execution_lifetime = ""     # string | optional | The maximum duration after which the job execution is expire…
    project                    = ""     # string | optional | The project in which jobs are run. By default, the project c…

  }

  notebook { # list [0..1]
    notebook     = ""     # string | required | Path to input notebook. This can be the Cloud Storage URI of…
    archive_uris = []     # list(string) | optional | Cloud Storage URIs of archives to be extracted into the work…
    file_uris    = []     # list(string) | optional | Cloud Storage URIs of files to be placed in the working dire…

    infrastructure_spec { # list [0..1]

      batch { # list [0..1]
        executors_count     = 0      # number | optional | Total number of job executors. Executor Count should be betw…
        max_executors_count = 0      # number | optional | Max configurable executors. If maxExecutorsCount > executors…

      }

      container_image { # list [0..1]
        image           = ""     # string | optional | Container image to use.
        java_jars       = []     # list(string) | optional | A list of Java JARS to add to the classpath. Valid input inc…
        properties      = {}     # map(string) | optional | Override to common configuration of open source components i…
        python_packages = []     # list(string) | optional | A list of python packages to be installed. Valid formats inc…

      }

      vpc_network { # list [0..1]
        network      = ""     # string | optional | The Cloud VPC network in which the job is run. By default, t…
        network_tags = []     # list(string) | optional | List of network tags to apply to the job.
        sub_network  = ""     # string | optional | The Cloud VPC sub-network in which the job is run.

      }

    }

  }

  spark { # list [0..1]
    archive_uris       = []     # list(string) | optional | Cloud Storage URIs of archives to be extracted into the work…
    file_uris          = []     # list(string) | optional | Cloud Storage URIs of files to be placed in the working dire…
    main_class         = ""     # string | optional | The name of the driver's main class. The jar file that conta…
    main_jar_file_uri  = ""     # string | optional | The Cloud Storage URI of the jar file that contains the main…
    python_script_file = ""     # string | optional | The Gcloud Storage URI of the main Python file to use as the…
    sql_script         = ""     # string | optional | The query text. The execution args are used to declare a set…
    sql_script_file    = ""     # string | optional | A reference to a query file. This can be the Cloud Storage U…

    infrastructure_spec { # list [0..1]

      batch { # list [0..1]
        executors_count     = 0      # number | optional | Total number of job executors. Executor Count should be betw…
        max_executors_count = 0      # number | optional | Max configurable executors. If maxExecutorsCount > executors…

      }

      container_image { # list [0..1]
        image           = ""     # string | optional | Container image to use.
        java_jars       = []     # list(string) | optional | A list of Java JARS to add to the classpath. Valid input inc…
        properties      = {}     # map(string) | optional | Override to common configuration of open source components i…
        python_packages = []     # list(string) | optional | A list of python packages to be installed. Valid formats inc…

      }

      vpc_network { # list [0..1]
        network      = ""     # string | optional | The Cloud VPC network in which the job is run. By default, t…
        network_tags = []     # list(string) | optional | List of network tags to apply to the job.
        sub_network  = ""     # string | optional | The Cloud VPC sub-network in which the job is run.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  trigger_spec { # list [1..1]
    type        = ""     # string | required | Trigger type of the user-specified Task Possible values: ["O…
    disabled    = false  # bool | optional | Prevent the task from executing. This does not cancel alread…
    max_retries = 0      # number | optional | Number of retry attempts before aborting. Set to zero to nev…
    schedule    = ""     # string | optional | Cron schedule (https://en.wikipedia.org/wiki/Cron) for runni…
    start_time  = ""     # string | optional | The first run of the task will be after this time. If not sp…

  }

}

