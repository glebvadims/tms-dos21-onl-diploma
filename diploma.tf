provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "default" {
  name         = "terraform-vm"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

output "instance_ip" {
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
  description = "The external IP address of the VM"
}
