variable "vpc_id" {
  
    description = "ID of VPC"
    type = string
    default = ""

}

variable "subnet_id" {
  
  description = "Subnet used in VPC"
  type = string
  default = ""
  
}

variable "machine-type" {

  type = string
  description = "Machine type used in instance group"
  
}

variable "instance-number" {

  type = number
  description = "Number of instances in group"
  default = 1
}

variable "image-name" {

  type = string
  description = "Image used for creating instances"

}

variable "zone" {
  
    type = string
    description = "Zone inside of region"
    default = "us-central1-a"

}

variable "project-name" {
  
    type = string
    description = "Project name"
}

variable "network-tags" {
  
    type = list(string)
    description = "List of network tags for VMs" 
    default = []

}

variable "instance-group-name" {

  type = string
  
}

variable "base-instance-name" {

  type = string
  default = "instance"
  
}

