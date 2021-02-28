# we like to create multiple instances for same provider ie - 2 GCP providers

# This is default provider. If nothing is specified in a resource, this provider will be called.
provider "google" {
    credentials = file("./../my-first-project-298218-a7316b8c9560.json")
    project = "my-first-project-298218"
    region  = "us-central1"
    zone    = "us-central1-a"
 }

# You need to call this provider explictly in the resource block using the alias.
provider "google" {
    credentials = file("./../my-first-project-298218-a7316b8c9560.json")
    project = "my-first-project-298218"
    region  = "us-central1"
    zone    = "us-central1-a"
    alias = "gcp_1"
  }

resource "google_compute_instance" "instance_1" {
    name : "instance_1"
  }

resource "google_compute_instance" "instance_2" {
    name : "instance_2"
    provider : google.gcp_1
  }
