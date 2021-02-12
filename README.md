# terraform-intermediate
This is intermediate terraform guide

<b> Providers in details </b>
- We can declare multiple provider blocks for same provider.
- The one without any alias key is consider as default and will be used if others are not called  explicitly.
- Others should be declared with alias key and value.
- Documentation : https://www.terraform.io/docs/language/providers/configuration.html

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