resource "oci_core_instance" "TFRPASInstance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
  shape = "${var.InstanceShape}"
  display_name = "${var.NamePrefix} RPAS server"
  hostname_label = "${lower(var.NamePrefix)}-rpas"

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
