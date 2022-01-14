provider "google" {
  credentials = file("learning-terraform-337205-8d441f351167.json")

  # PROJECT_ID
  project = "learning-terraform-337205"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance"{
  name = "terraform-instance-2"
  machine_type = "f1-micro"

  boot_disk{
    initialize_params{
      image= "debian-cloud/debian-9"
    }
  }

  network_interface {
    #default network is created for all GCP project
    network = "${google_compute_network.vpc_network.self_link}"
  }
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
  auto_create_subnetworks = "true"
}
