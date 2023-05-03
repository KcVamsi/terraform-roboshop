# all these are the types of variables

variable "sample_string" {
    default = "hello vamsi"
  
}

output "sample_string" {
  value = var.sample_string
}

# here we have only a variable so we use var.sample_String


variable "sample_stringwithvar" {
  default = "hello kc"
}

output "sample_stringwithvar" {
  value = "${var.sample_stringwithvar}"
}
# # if have a variable with a combination of some string to print that we use ${}
# value = "value of sample_stringwithvar = ${var.sample_stringwithvar}"



# # we keep these outputs in the output.tf file as the terraform will run all the files in the folder at a time.data "

# variable "sample_number" {
#     default = 1909
  
# }

# variable "sample_boolean" {
#     default = true
  
# }


# variable "sample_list" {
#     default = [
#         100,
#         "hello",
#         true,
#         123,
#         1405.4
#     ]
# }

# # we preffer dict over the list.


# variable "sample_dict" {
#     default = {
#         number1 = 100
#         string1 = "hello"
#         number2 = 2324
#         boolean = true
# }
  
# }


# # for dynamically passing values we give a empty variable

#  variable "env" {}

# variable "auto_num1" {}

# variable "sample1" {}