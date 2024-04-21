#tf state bucket

provider "google" {
    
    #Key path for service account on GCP
    credentials = file("/Users/abalabanovic/Downloads/gcp-key.json")
    project = "gd-gcp-internship-devops"
    region = "us-central1"
    zone = "us-central1-a"
}

module "network" {
  
source = "./network"
vpc-name = "vpc-andrej"
subnet-name = "custom-subnet1"
region = "us-central1"
cidr-range = "10.0.1.0/24"
#health check ip ranges 35.191.0.0/16 130.211.0.0/22
source-ranges = ["0.0.0.0/0"]
instance-group-self-link = module.compute.instance_group_self_link

firewall_rules = {
  http = {

        name = "http-firewall-rule"
        description = "Allow HTTP traffic"
        protocol = "tcp"
        ports = ["80"]
        target_tags = ["http-allow"]
        
  }

  ssh = {

        name = "ssh-firewall-rule"
        description = "Allow SSH traffic"
        protocol = "tcp"
        ports = ["22"]
        target_tags = ["ssh-allow"]
      

  }

}

}

module "compute" {

source = "./compute"
project-name = "gd-gcp-internship-devops"
vpc_id = module.network.network_name
subnet_id = module.network.subnet_name
machine-type = "e2-micro"
instance-number = 3
image-name = "projects/gd-gcp-internship-devops/global/images/apache-image"
zone = "us-central1-a"
network-tags = ["http-allow", "ssh-allow"]
instance-group-name = "instance-group-manager"
base-instance-name = "instance"


}
