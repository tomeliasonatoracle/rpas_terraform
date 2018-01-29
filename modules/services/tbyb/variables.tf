variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}

variable "SubnetOCID" {}
variable "AD" {}
variable "InstanceShape" {}
variable "InstanceOS" {}
variable "InstanceOSVersion" {}
variable "BlockStorageSize" {}
variable "NamePrefix" {}
variable "BootStrapFile" {
    default = "./userdata/tbyb-bootstrap"
}

