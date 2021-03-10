variable "vm_names" {
  type = list(string)
  description = "List of VM Instances Names"
}

variable "vm_required" {
  type = bool
  description = "to specifcy if VM is required or not"
}