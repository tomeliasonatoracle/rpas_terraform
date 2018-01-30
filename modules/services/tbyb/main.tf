resource "oci_core_instance" "TFTBYBInstance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  display_name = "TBYB ${var.NamePrefix}"
  hostname_label = "tbyb-${lower(var.NamePrefix)}"

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
#    user_data = "${base64encode(file(var.BootStrapFile))}"
  }

  create_vnic_details {
    subnet_id = "${var.SubnetOCID}"
    assign_public_ip = "true"
  }

  timeouts {
    create = "60m"
  }
}
