# convert lower case to upper case

variable "sample" {
    default = "abssdj"
  
}

output "sample" {
    value = upper{var.sample}
  
}