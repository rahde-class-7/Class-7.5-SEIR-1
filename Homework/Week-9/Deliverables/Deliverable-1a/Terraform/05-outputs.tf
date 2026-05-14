output "dev-vpc-network-network_id" {
  value = google_compute_network.dev-vpc-network.network_id 
  description = "value"
}

output "project_id" {
  value = var.project_id
  description = "value"
}

output "instance-group-server-mig-self_link" {
  value = google_compute_instance_group_manager.server-mig.self_link
  description = "value"
}

