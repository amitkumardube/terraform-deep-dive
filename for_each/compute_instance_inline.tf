resource "google_compute_instance" "default_inline" {
  name = "test"
  machine_type = "n1-micro"

  metadata = var.tags

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
