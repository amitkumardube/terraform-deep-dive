resource "google_compute_firewall" "for_each_firewall" {
  name = "for-each-firewall"
  network = google_compute_network.for_each_network.name

  // this will ensure that it looks through the entire set of ports to create a dynamic content
  dynamic "allow" {
    for_each = var.ports
    content {
      protocol = "tcp"
      ports = [allow.value]
    }
  }
}