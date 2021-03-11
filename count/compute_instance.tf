resource "google_compute_instance" "default" {
  count = var.vm_required ? length(var.vm_names) : 0
  name = var.vm_names[count.index]
  machine_type = "f1-micro"
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}