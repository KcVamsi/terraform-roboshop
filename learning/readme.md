1. VARIABLES

# how to declare a variable.

a. variable "sample_string" {
default = "hello world"
}


# here "sample_string" is the name of the variable. we are declaring it.

# "hello world" is the output we need, for that we use default.

## this 2 lines are equal to sample_String="hello world" in shell scripting

# in terraform for varibale we are giving acname and for the output also we need to give a name.

# how do we access our variable or print the output is - 

output "sample_string" {
value = var.sample_string
}

## this 2 lines are equal to echo=$sample_string in shell scripting

# in the above case we are just printing variable. if variable is a combination of string (sample_String1) then we use this

output "sample_string1" {
    value = "value of sample_string = ${var.sample_string}"
}

# ${} is mandatory if we want to print the variables with string.


2.    DATA TYPES

# string, number, boolean

# booleans are true or false.

# booleans and numbers doesnt need to be double quoted.

# only strings needs to be double quoted.


# terraform doesnt support the single quotes.



1. variable "sample string" {
    default = "hello world"
}


2. variable "sample_number" {
    default = 100
}


3. variable "sample_boolean" {
    deafult = true
}



3.   TYPES OF VARIABLES

# till now we have seen a default one but we have others


# list variable type - which means single variable can hold mulitple values.


b. variable "sample_list" {
    default = [
        100,
        "hello"
        true,
        123
        1405.4
    ]
}

# data types inside the list doesnt mean to the terraform.

# how to get output from the list.
# for example if we need the 2nd value from the list, then

# "the list value starts from 0" #

output = "sample_list_2" {
    value = var.sample_list[1]
}



# instead of list we can use the dictonary or map.

# single variable have multiple values and each value have a separate name.

c. variables "sample_dict" {
    default = [
        number1 = 100
        string1 = "hello"
        number2 = 123
        boolean = true
    ]
}

# this is the most preffered variable over the list variable beacuse here we dont need to follow any order when we decalre the date, we can use them at any place.


#  till now we are giving the inputs before only, if we want to give dynamically then we use "dev.tfvars" and "prod.tfvars"


# for dynamically passing the values we declare a empty variable means no default values - "dev.tfvars" and "prod.tfvars"

d. variable "env" {} 

 # in cloud shell for getting the dev output we use "terraform apply -var-file=dev.tfvars" and for the prod output we use "terraform apply -var-file=prod.tfvars"


e. 
 