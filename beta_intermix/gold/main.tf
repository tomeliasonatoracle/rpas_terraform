provider "oci" {
  fingerprint = "${var.fingerprint}"
  region = "${var.region}"
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  private_key_path = "${var.private_key_path}"
}

module "nfs" {
  source = "../../modules/services/nfs"

  NamePrefix = "${var.name_prefix}"
  AD = "${var.default_ad}"
  BlockStorageSize = "2048" #GB
  compartment_ocid="${var.compartment_ocid}"
  SubnetOCID="${var.SubnetOCID}"
#  InstanceOS="${var.default_os}"
#  InstanceOSVersion="${var.default_os_version}"
  InstanceOS="Oracle Linux"
  InstanceOSVersion="6.9"
  InstanceShape="VM.Standard1.1"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
}

module "rpas" {
  source = "../../modules/services/rpas"

  NamePrefix = "${var.name_prefix}"
  AD = "${var.default_ad}"
  BlockStorageSize = "250" #GB
  compartment_ocid="${var.compartment_ocid}"
  SubnetOCID="${var.SubnetOCID}"
#  InstanceOS="${var.default_os}"
#  InstanceOSVersion="${var.default_os_version}"
  InstanceOS="Oracle Linux"
  InstanceOSVersion="6.9"
  InstanceShape="VM.Standard1.2"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  ssh_private_key = "${var.ssh_private_key}"  # as we exec
  ftp_nfs_mount = "${module.nfs.InstancePrivateMount[0]}"
}

module "wls" {
  source = "../../modules/services/wls"

  NamePrefix = "${var.name_prefix}"
  AD = "${var.default_ad}"
  BlockStorageSize = "50" #GB
  compartment_ocid="${var.compartment_ocid}"
  SubnetOCID="${var.SubnetOCID}"
#  InstanceOSVersion="${var.default_os_version}"
#  InstanceShape="VM.Standard1.2"
  InstanceOS="Oracle Linux"
  InstanceOSVersion="6.9"
  InstanceShape="VM.Standard1.2"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
}

module "idm" {
  source = "../../modules/services/idm"

  NamePrefix = "${var.name_prefix}"
  AD = "${var.default_ad}"
  BlockStorageSize = "50" #GB
  compartment_ocid="${var.compartment_ocid}"
  SubnetOCID="${var.SubnetOCID}"
#  InstanceOS="${var.default_os}"
#  InstanceOSVersion="${var.default_os_version}"
  InstanceOS="Oracle Linux"
  InstanceOSVersion="6.9"
  InstanceShape="VM.Standard1.4"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
}

module "db" {
  source = "../../modules/services/db"

  NamePrefix = "${var.name_prefix}"
  AD = "${var.default_ad}"
  BlockStorageSize = "50" #GB
  compartment_ocid="${var.compartment_ocid}"
  SubnetOCID="${var.SubnetOCID}"
  InstanceOS="${var.default_os}"
  InstanceOSVersion="${var.default_os_version}"
  InstanceShape="VM.Standard1.2"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
}


output "NFSInstancePrivateMount" {
  value = ["${module.nfs.InstancePrivateMount}"]
}

output "NFSInstanceHostname" {
  value = ["${module.nfs.InstanceHostname}"]
}

output "NFSInstancePrivateIP" {
  value = ["${module.nfs.InstancePrivateIP}"]
}

output "NFSInstancePublicIP" {
  value = ["${module.nfs.InstancePublicIP}"]
}

output "RPASInstanceHostname" {
  value = ["${module.rpas.InstanceHostname}"]
}

output "RPASInstancePrivateIP" {
  value = ["${module.rpas.InstancePrivateIP}"]
}

output "RPASInstancePublicIP" {
  value = ["${module.rpas.InstancePublicIP}"]
}

output "WLSInstanceHostname" {
  value = ["${module.wls.InstanceHostname}"]
}

output "WLSInstancePrivateIP" {
  value = ["${module.wls.InstancePrivateIP}"]
}

output "WLSInstancePublicIP" {
  value = ["${module.wls.InstancePublicIP}"]
}

output "IDMInstanceHostname" {
  value = ["${module.idm.InstanceHostname}"]
}

output "IDMInstancePrivateIP" {
  value = ["${module.idm.InstancePrivateIP}"]
}

output "IDMInstancePublicIP" {
  value = ["${module.idm.InstancePublicIP}"]
}

output "DBInstancePrivateIP" {
  value = ["${module.db.InstancePrivateIP}"]
}

output "DBInstancePublicIP" {
  value = ["${module.db.InstancePublicIP}"]
}


variable name_prefix {
  default = "imx-gold"
}

variable default_ad {
  default = "3"
}

variable default_os {
  default = "Oracle Linux"
}

variable default_os_version {
  default = "7.4"
}

variable user_ocid {}
variable tenancy_ocid {}
variable fingerprint {}
variable private_key_path {}
variable region {}
variable compartment_ocid {}
variable ssh_public_key {}
variable ssh_private_key {}
variable SubnetOCID {}
