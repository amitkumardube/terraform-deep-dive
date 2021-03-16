# terraform-deep-dive
This is Terraform Deep Dive guide

Topics to Cover
- Terraform Settings
- Providers ( multiple blocks for same provider )
- Backend
- State and Remote State
- Loops and If statement
- Variables ( sensitive )
- Workspaces
- Other Terraform Commands
- Terraform Import
- Debugging in Terraform
- Certification Journey

<b> Terraform Settings </b>
- This terraform configuration block is used to configure some behaviors of Terraform itself like   
    - CLI Version
    - Required Providers
    - Backend
    - Experimental Features
- Documentation - https://www.terraform.io/docs/language/settings/index.html

<b> Providers in details </b>
- We can declare multiple provider blocks for same provider.
- The one without any alias key is consider as default and will be used if others are not called  explicitly.
- Others should be declared with alias key and value.
- To refer to a one of these provider in resource , we need to call them using resource { provider : provider_name.alias}
- The provider block can be omitted if it has no configuration. If not specified, any reference to a provider will call provider with no configuration. if configuration is mandatory, then terraform will throw an error.
- Documentation : https://www.terraform.io/docs/language/providers/configuration.html

<b> Backend Confiuration </b>
- Where state is stored.
- Where operations are performed.
- If you have never used a backend then you are by default using a local backend.
- Local backend stores state information in local terraform.tfstate file and operations are run locally.
- Documentation : https://www.terraform.io/docs/language/settings/backends/index.html

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

<b> Loops in Terraform </b>
- count : loop over resources.
- for_each : loop over resources and inline blocks within the resources.
- for : loop over list and map.

<b> If statement </b>
- If can be combined with any of the above loops.
- We are using conditional statement with count loop.

<b> Workspaces in terraform </b>
- Workspaces help in managing multiple environment.
- They help you segregate your state file for each environment.
- Terraform by default has a ```default``` workspace. This workspace can never be deleted.
- ```terraform workspaces new dev``` - this will create a new workspace dev and will switch to that workspace.
- Once there are additional workspaces, terraform stores the state file under terraform.tfstate.d/<workspace_name>/terraform.tfstate file.
- The current workspace value is always stored in `terraform.workspace` variable and can be accessed from there during interpolation.

<b> Importing Configuration under Terraform management using terraform import </b>
- If you have already existing infrastructure which you like to bring under Terraform management, it's possible via terraform import.
- The import command maps the address of a resource in terraform with ID of that resource at cloud provider end.
- `terraform import [--var-file <name of the file>] ADDR ID`
- Documentation - https://www.terraform.io/docs/cli/import/index.html

<b> Other Terraform Commands </b>
- terraform fmt - to format your config files. - https://www.terraform.io/docs/cli/commands/fmt.html
- terraform validate - to validate the config files. - https://www.terraform.io/docs/cli/commands/validate.html
- terraform version - to inspect the version of terraform installed.
- terraform show - to see the human readable output of the state file or plan file. - https://www.terraform.io/docs/cli/commands/show.html
- terraform state - this is used for management for state file. - https://www.terraform.io/docs/cli/commands/state/index.html

<b> Debugging in terraform </b>
- Documentation : https://www.terraform.io/docs/internals/debugging.html.
- TF_LOG and TF_LOG_PATH are 2 environment variables setup to control the debugging in terraform.
- TF_LOG can be TRACE, DEBUG, INFO, WARN or ERROR. TRACE is default and most verbose.
- TF_LOG_PATH - This is the path of the log file where you can store/append the output.
- If the value of TF_LOG is any other value then defined above, then terraform uses the default value which is TRACE.

<b> Terraform Associate Certification Journey </b>

https://amitkumardube.medium.com/hashicorp-terraform-associate-certification-journey-2021-ee5577f6f9da

<b> Some Sample Certification Questions </b>
