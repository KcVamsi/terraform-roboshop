# here we have a string to print

output "sample_string" {
    value = var.sample_string
  
}

# here we have a variable with a combination of some string to print

output "sample_string1" {
    value = "value of sample_string = ${var.sample_string}"
  
}

# print the 2nd value in the lsit


output "sample_list_2" {
    value = var.sample_list[1]
}


# print number1 in the dict 

output "sample_dict_number" {
    value = var.sample_dict["number1"]
  
}


output "sample_dict_boolean" {
    value = var.sample_dict["boolean"]
  
}



# for dynamically passing the values

output "env" {
    value = var.env
  
}


output "auto_num1" {
    value = var.auto_num1
  
}

