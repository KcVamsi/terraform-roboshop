1. variables

# how to declare a variable.

variable "sample_string" {
default = "hello world"
}


# here "sample_string" is the name of the variable. we are declaring it.

# "hello world" is the output we need, for that we use default.

## this 2 lines are equal to sample_String="hello world" in shell scripting

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

