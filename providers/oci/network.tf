# VCN
resource "oci_core_vcn" "test_vcn" {
    cidr_block = "${var.vcn_cidr_block}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.vcn_display_name}"
    dns_label = "${var.vcn_dns_label}"
}

# Internet Gateway
resource "oci_core_internet_gateway" "test_internet_gateway" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    display_name = "${var.internet_gateway_display_name}"
    enabled = true
}

# RouteTable
resource "oci_core_route_table" "test_route_table" {
    compartment_id = "${var.compartment_ocid}"
    route_rules {
        network_entity_id = "${oci_core_internet_gateway.test_internet_gateway.id}"
        destination = "0.0.0.0/0"
    }
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    display_name = "${var.route_table_display_name}"
}

# Security list (not DB)
resource "oci_core_security_list" "test_security_list" {
    compartment_id = "${var.compartment_ocid}"
    egress_security_rules {
        destination = "${var.sl_egress_destination}"
        protocol = "${var.sl_egress_protocol}"
        stateless = false
    }

    ingress_security_rules {
        source = "${var.sl_ingress_source}"
        protocol = "${var.sl_ingress_protocol}"
        stateless = false
        tcp_options{
            max = "${var.sl_ingress_tcp_dest_port_max}"
            min = "${var.sl_ingress_tcp_dest_port_min}"
        }
    }
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    display_name = "${var.sl_display_name}"
}

# Subnet
resource "oci_core_subnet" "test_subnet" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
    cidr_block = "${var.subnet_cidr_block}"
    compartment_id = "${var.compartment_ocid}"
    security_list_ids = ["${oci_core_security_list.test_security_list.id}"]
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    display_name = "${var.subnet_display_name}"
    dns_label = "${var.subnet_dns_label}"
    prohibit_public_ip_on_vnic = "${var.subnet_prohibit_public_ip_on_vnic}"
    route_table_id = "${oci_core_route_table.test_route_table.id}"
}


