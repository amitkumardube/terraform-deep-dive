variable "vm_names" {
  type = list(string)
  description = "List of VM Instances Names"
}

variable "tags" {
  description = "Custom tags to set on the Instances"
  type        = map(string)
  sensitive = true
}