provider "google" {
  credentials = "${var.gcp_key_path}"
  project     = "${var.gcp_project_id}"
  region      = "${var.gcp_region_name}"
}

resource "google_compute_instance" "gcp-instance-1" {
  name         = "${var.gcp_instance_1}"
  machine_type = "g1-small"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      size  = 10
      type  = "pd-standard"
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_instance" "gcp-instance-2" {
  name         = "${var.gcp_instance_2}"
  machine_type = "g1-small"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      size  = 10
      type  = "pd-standard"
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip       = "${var.jenkins_nat_ip}"
      network_tier = "STANDARD"
    }
  }

  metadata {
    ssh-keys = "${var.ssh_key_client}"
  }
}

resource "google_compute_instance" "gcp-instance-3" {
  name         = "${var.gcp_instance_3}"
  machine_type = "g1-small"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      size  = 10
      type  = "pd-standard"
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }

  metadata {
    ssh-keys = "${var.ssh_key_client}"
  }
}
