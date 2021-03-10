output "for_instance_name" {
    value = [for name in var.vm_names : upper(name)]
}