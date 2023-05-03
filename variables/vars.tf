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
# value = "${var.sample_stringwithvar}"



# # we keep these outputs in the output.tf file as the terraform will run all the files in the folder at a time.data "

variable "sample_number" {
    default = 1909
  
}

variable "sample_boolean" {
    default = true
  
}


variable "sample_list" {
    default = [
        100,
        "hello",
        true,
        123,
        1405.4
    ]
}



output "sample_list_2" {
  value = var.sample_list[1]
  
}

# sample_list_2 is the name we are giving to the output as we need the 2nd value in the list but the order starts with 0 so it will be the 1st value.

output "sample_list_3" {
  value = var.sample_list [2]
  
}


# if we want two valuesfrom the list we have to give two outputs.



# # we preffer dictionary over the list.


variable "sample_dict" {
    default = {
        number1 = 100
        string1 = "hello"
        number2 = 2324
        boolean = true
}
  
}


# to print the outpuut of number1

output "sample_dict_number1" {
  value = var.sample_dict["number1"]
  
}


# # for dynamically passing inputs we need prod.tfvars and dev.tfvars


# we need to declare a empty variable and we can use prod or the dev environment for the dynamic use.


variable "env" {}

output "env" {
  value = var.env
  
}

# if we need an prod environment then we use

# terraform apply -var-file=dev.tfvars

# if we need an prod environment then we use 

# terraform apply -var-file=prod.tfvars






variable "auto_num1" {
  
}

output "auto_num1" {
  value = var.auto_num1

}

# for this we dont need to give the output cmnd as it will automatically gets the output.


# variable "sample1" {}