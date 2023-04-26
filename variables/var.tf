variable "sample_string" {
    
  default = "hello world"
}

output "sample_string" {
  value = var.sample_string
}