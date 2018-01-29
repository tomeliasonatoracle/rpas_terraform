resource "oci_core_volume" "TFTBYBBlock0" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.NamePrefix} TBYB storage"
  size_in_gbs = "${var.BlockStorageSize}"
}

resource "oci_core_volume_attachment" "TFTBYBBlock0Attach" {
    attachment_type = "iscsi"
    compartment_id = "${var.compartment_ocid}"
    instance_id = "${oci_core_instance.TFTBYBInstance.id}"
    volume_id = "${oci_core_volume.TFTBYBBlock0.id}"
}

