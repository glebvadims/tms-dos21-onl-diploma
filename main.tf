provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "default" {
  name         = "dos21-onl"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = var.ip_static
    }
  }
  metadata = {
    ssh-keys = "nightasura:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEoV0DVT0OB+hofUe2omT7c0dejwvOVLpX7xdm/U7mUa nightasura"
  }

}  

output "instance_ip" {
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
  description = "The external IP address of the VM"
}
