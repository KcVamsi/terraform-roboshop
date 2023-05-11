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
    value = var.sample2["a1"]

}


# here we are giving "a1" which is not there so it should nt show error , instead of that it shoul as dummy so that our code runs

