output "network_name" {
  
    value = google_compute_network.vpc.name
    description = "ID of VPC"

}

output "subnet_name" {
  
  value = google_compute_subnetwork.custom-subnet1.name
  description = "Subnet used inside of VPC"
}

