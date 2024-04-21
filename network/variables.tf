variable "vpc-name" {
  
    type = string
    description = "Name for VPC"
}

variable "subnet-name" {
  
    type = string
    description = "Name for custom subnet"

}

variable "region" {
  
    type = string
    description = "Region name"
    default = "us-central1"

}

variable "cidr-range" {
  
    type = string
    description = "CIDR range for subnet"
    default = "10.0.0.0/24"

}

variable "custom-subnet" {
  
    type = bool
    default = false
    description = "Use custom subnet in VPC"

}

variable "source-ranges" {
    
    type = list(string)
    description = "IP addreses allowed for incoming traffic"
    default = ["0.0.0.0/0"]

}

variable "instance-group-self-link" {
  
    description = "Instance group link"

}


variable "firewall_rules" {

    type = map(object({

      name = string
      description = string
      target_tags = list(string)
      protocol = string
      ports = list(string)
      
    }))
 
}

