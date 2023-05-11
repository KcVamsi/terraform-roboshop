# convert lower case to upper case

variable "sample" {
    default = "abssdj"
  
}

output "sample" {
    value = upper(var.sample)
  
}


variable "sample1" {
    default = [ "abc", "sads" ]
  
}

# if we want to print the 1st value of the two then we can get it by function named "element"
# or by the cmnd var.sample1[0]
output "sample1" {
    value = element(var.sample1, 0)
  
}




