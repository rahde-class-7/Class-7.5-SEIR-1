#### CREATE OUTPUTS

### THESE OUTPUTS WERE USED TO VERIFY THAT THE OBJECTS WERE UPLOADED INTO THE BUCKET
output "google_storage_bucket_object_index_public_url" {
  value = google_storage_bucket_object.index.self_link
}

output "google_storage_bucket_object_error_public_url" {
  value = google_storage_bucket_object.error.self_link
}

output "google_storage_bucket_object_image_public_url" {
  value = google_storage_bucket_object.image.self_link
}
