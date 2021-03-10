variable "vm_names" {
  type = list(string)
  description = "List of VM Instances Names"
}

variable "tags" {
  description = "Custom tags to set on the Instances"
  type        = map(string)
  sensitive = true
}

variable "ports" {
  type = list(string)
  description = "The tcp ports that are allowed on firewall"
}