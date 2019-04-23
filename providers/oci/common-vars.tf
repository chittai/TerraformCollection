variable "compartment_ocid" {}
data "oci_identity_availability_domains" "ADs" {
    provider = "oci.us-ashburn-1"
    compartment_id = "${var.tenancy_ocid}"
}
