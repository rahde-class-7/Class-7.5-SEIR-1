output "instance_internal_ip" {
  value       = google_compute_instance.dev-instance.network_interface.0.network_ip
  description = "value"
}
# output "instance_external_IP" {
#  value = google_compute_instance.dev-instance.network_interface.0.network_ip
#  description = "value"
# }

output "instance_name" {
  value       = google_compute_instance.dev-instance.name
  description = "value"
}
output "instance_id" {
  value       = google_compute_instance.dev-instance.instance_id
  description = "value"
}

output "instance_self_link" {
  value       = google_compute_instance.dev-instance.self_link
  description = "value"
}
