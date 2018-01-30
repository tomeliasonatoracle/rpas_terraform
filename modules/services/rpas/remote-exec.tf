#resource "null_resource" "remote-exec" {
  # This is exists as we need to pass the mount point for NFS
  # all dependencies for NFS mounting need to be in here as we cannot
  # guarantee the execution graph will have completed other tasks before

#  depends_on = ["oci_core_instance.TFRPASInstance"]
#    provisioner "remote-exec" {
#      connection {
#        agent = false
#        timeout = "10m"
#        host = "${data.oci_core_vnic.InstanceVnic.private_ip_address}"
#        user = "opc"
#        private_key = "${var.ssh_private_key}"
#    }
#      inline = [
#        "sudo yum -q -y install nfs-utils",
#	"sudo mkdir /u99",
#	"cp /etc/fstab fstab.local",
#	"echo Configuring NFS:${var.ftp_nfs_mount}",
#	"echo \"${var.ftp_nfs_mount}    /u99    nfs    defaults,noatime,_netdev,nofail\" >> fstab.local",
#	"sudo cp fstab.local /etc/fstab",
#	"sudo mount /u99",
#	"rm fstab.local"
#      ]
#    }
#}
