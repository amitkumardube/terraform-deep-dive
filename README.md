# terraform-intermediate
This is intermediate terraform guide

<b> Providers in details </b>
- We can declare multiple provider blocks for same provider.
- The one without any alias key is consider as default and will be used if others are not called  explicitly.
- Others should be declared with alias key and value.
- To refer to a one of these provider in resource , we need to call them using resource { provider : provider_name.alias}
- Documentation : https://www.terraform.io/docs/language/providers/configuration.html

<b> Common resource Arguments </b>
- depends_on : this will set an explicit dependency between resources.
- count : this works like loop in other programing language.
- for_each : this takes map as argument.
- provider : this is to confirm which provider to be used for creation of this resource.

<b> Variables in terraform </b>
- While declaring a variable, you need to provide name , type , default value , description. The last 3 optional.
- You can pass variable values from multiple sources
    - File , environment variable , var option.
- The variable precedence is as below.
    - Environment(least) , file , var option (most).
<b> Workspaces in terraform </b>
- Workspaces help in managing multiple environment.
- They help you segregate your state file for each environment.
- terraform workspaces create dev - this will create a new workspace dev.

<b> Purpose of state file </b>
- Documentation - https://www.terraform.io/docs/language/state/purpose.html
- Mapping for terraform resource to objects on cloud provider end.
- Storing the resources deletion order if resource is removed from the config file.
- Storing meta data about which resource is mapped to which provider in case of aliased providers.
- It helps in performance when you run plan and apply with -refresh=false flag. Otherwise terraform refreshes state file with each execution of plan and apply.

<b> What is remote state file </b>
- Documentation - https://www.terraform.io/docs/language/state/remote.html
- It's stored on a remote backend. It shared between team members so that everyone refers to latest version of state file.
- Delegation and Team-Work : remote state allows you to share output values with other configurations. This is achieved by terraform_remote_state data source.
- Documentation - https://www.terraform.io/docs/language/state/remote-state-data.html
- Locking - Remote state can be locked so that only one team member can apply the change at any point in time.

<b> Other Terraform Commands </b>
- terraform fmt - to format your config files.
- terraform validate - to validate the config files.
- terraform version - to inspect the version of terraform installed.
- terraform show - to see the output of the state file.
- terraform state list - to list only specific resources from state file.

<b> Debugging in terraform </b>
- Documentation : https://www.terraform.io/docs/internals/debugging.html.
- TF_LOG and TF_LOG_PATH are 2 environment variables setup to control the debugging in terraform.
- TF_LOG can be TRACE, DEBUG, INFO, WARN or ERROR. TRACE is default and most verbose.
- TF_LOG_PATH - This is the path of the log file where you can store/append the output.

