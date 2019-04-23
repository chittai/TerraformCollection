variable "NumInstances" {
    default = "1"
}

variable "instance_shape" {
    default = "VM.Standard2.1"
}

variable "instance_display_name" {
}

variable "instance_image_ocid" {
    type = "map"
    default = {
        us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaaxwo4ovajb6fr5jih6czpffacijuwgwvavhamk5pk5ixkx52yu7da"
    }
}

variable "ssh_public_key" {}
