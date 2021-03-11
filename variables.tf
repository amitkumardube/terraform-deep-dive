// all the terraform variables are declared in this file
// variables those contains default value are considered optional others are mandatory

variable "provider_config" {
  type = object(
    {
      project_id = string,
      region = string,
      zone = string,
      new_region = string,
      new_zone = string
    }
  )
}

variable "count_vm_names" {
  type = list(string)
}

variable "for_each_vm_names" {
  type = list(string)
}

variable "tags" {
  description = "Custom tags to set on the Instances"
  type        = map(string)
}

variable "ports" {
  type = list(string)
}

variable "vm_required" {
  type = bool
  description = "to specifcy if VM is required or not"
}