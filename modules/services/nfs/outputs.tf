# Output the private and public IPs of the instance

output "InstanceHostname" {
  value = ["${data.oci_core_vnic.InstanceVnic.hostname_label}"]
}

output "InstancePrivateIP" {
  value = ["${data.oci_core_vnic.InstanceVnic.private_ip_address}"]
}

output "InstancePublicIP" {
  value = ["${data.oci_core_vnic.InstanceVnic.public_ip_address}"]
}

output "InstancePrivateMount" {
  value = ["${data.oci_core_vnic.InstanceVnic.private_ip_address}:/scratch"]
}
