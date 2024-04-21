
resource "google_compute_instance_template" "instance_template" {
  
    name = "instance-template"
    machine_type = var.machine-type
   

  disk {
  
      source_image = var.image-name
    
  }

    network_interface {

        network = var.vpc_id
        subnetwork = var.subnet_id

        # To get the external IP for VM
        access_config {
          #Leaving empty will give us random public IP
        }

    }

    tags = var.network-tags

    metadata_startup_script = <<-EOF
        
        name=$(hostname)
        echo "Welcome to server $name" > /var/www/html/index.html
         
    EOF


}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  
  name = var.instance-group-name
  zone = var.zone
  base_instance_name = var.base-instance-name
 
  target_size = var.instance-number

  version {
    
    instance_template = google_compute_instance_template.instance_template.self_link
  }

  named_port {
    name = "http"
    port = 80
  }

}