provider "google" {
		credentials = "${var.gcp_key_path}"
		project = "${var.gcp_project_id}"
		region = "${var.gcp_region_name}"
}

resource "google_compute_instance" "gcp-instance-1" {
	name = "${var.gcp_instance_1}"
	machine_type = "g1-small"
	zone = "${var.gcp_zone}"

	boot_disk {
		initialize_params {
			size = 10
			type = "pd-standard"
			image = "centos-cloud/centos-7"
		}
	}

	network_interface {
		network = "default"
	}
}