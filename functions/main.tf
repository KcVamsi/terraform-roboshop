# convert lower case to upper case

variable "sample" {
    default = "abssdj"
  
}

output "sample" {
    value = upper(var.sample)
  
}


variable "sample1" {
    default = ["abc", "sads"]
  
}

# if we want to print the 1st value of the two then we can get it by function named "element"
# or by the cmnd var.sample1[0]
output "sample1" {
    value = element(var.sample1, 0)
  
}


variable "sample2" {
    default = {
        xyx = 111
        ascsf = 343
        sdad =33
    }
  
}

# here we are having a map, so we need a lookup function
output "sample2" {
  
}

