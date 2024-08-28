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
      network_tier = "STANDARD"
    }
  }
  metadata = {
    ssh-keys = "nightasura:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD7AQ1ynUWd0Gqu2zZ/XYYgT+DZW3yoOiU4P3/BSL+z8VOhiEMx4HoNuHFfZklH84xb0jqKXZQHXrdPjCM2AbHayryXkfk9s5lOlfeUJfMam0bcIyxvFmyII0cnxqACxAV/WzxCWh7ovKqvLMyfeQK8LSP4M70X9YPxZ0S9tiBPgRpOPQx4Oahoapb+ic3Dnc/aaoES/w192mxtJJrsNNoOz1KHkR3xUFy606iIgWNP7lJgICZgpPuRMCKvUPYFT7uTlL9cpbWoA40t+8xs/iS77RoPfrtzIS3/tFPPFYbLrIe2gHz+f5+PAdOwT8NJpRrid87CJfGfRLPywuGyDmT9E8QxqcUsMrnZ/3Bm6YtnXY4n0xloRtTCqaWq+TaCSEGeuFUl2DQuJgn1U+p8uQsJL0/VF+mCwtRREFZvoifM2wxWPc2RU+OF4JKLU80AmuwlE2qfrP2NMTzZ3ryU8X47gOVBzp+ptFEwxz1QuZkuEx0XhCXWfd5qxjL8clvC6QU= nightasura"
  }

}  

output "instance_ip" {
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
  description = "The external IP address of the VM"
}
