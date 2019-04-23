# VCN
variable "vcn_cidr_block" {}
variable "vcn_display_name" {}
variable "vcn_dns_label" {}

# internet gateway
variable "internet_gateway_display_name"  {}

# route table
variable "route_table_display_name" {}

# security list web
variable "sl_egress_destination" {}
variable "sl_egress_protocol" {}
variable "sl_ingress_source" {}
variable "sl_ingress_protocol" {}
variable "sl_ingress_tcp_dest_port_max" {}
variable "sl_ingress_tcp_dest_port_min" {}
variable "sl_display_name" {}

# subnet 
variable "subnet_cidr_block" {}
variable "subnet_display_name" {}
variable "subnet_dns_label" {}
variable "subnet_prohibit_public_ip_on_vnic" {}
