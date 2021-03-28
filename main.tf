// This is called terraform settings block
terraform {
  // to mention what terraform CLI version should process this module
  required_version = ">=0.14"
  // this blocks declares a google provider with specific version
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.58.0"
    }
  }
  // to use an experimental feature. These features are considered under experiment and can change in future releases. We need to explicitly tell Terraform if we need to use a experimental feature.
  experiments = [provider_sensitive_attrs]

  // to use a backend other than local. Local is default
  backend "gcs" {
    bucket = "tf_remote_state_amit_test"
    prefix = "terraform/state"
  }
}

// since we have declared the provider google, let's declare the provider block with required configuration

provider "google" {
    project = var.provider_config["project_id"]
    region = var.provider_config["region"]
    zone = var.provider_config["zone"]
    credentials = file("my-first-project-298218-964978bfcdc4.json")
}

provider "google" {
    project = var.provider_config["project_id"]
    region = var.provider_config["new_region"]
    zone = var.provider_config["new_zone"]
    credentials = file("my-first-project-298218-964978bfcdc4.json")
    alias = "new_region"
}

// module for count
module "count_instance" {
    source = "./count"
    vm_names = var.count_vm_names
    vm_required = var.vm_required
}

// module for count with new_region_provider
module "count_instance_new_provider" {
    source = "./count"
    vm_names = var.count_vm_names
    vm_required = var.vm_required
    providers = {
      google = google.new_region
    }
}

// module for for_each
module "for_each_instance" {
    source = "./for_each"
    vm_names = var.for_each_vm_names
    tags = var.tags
    ports = var.ports
}

// module for for expression

module "for_instance" {
  source = "./for"
  vm_names = var.count_vm_names
}

