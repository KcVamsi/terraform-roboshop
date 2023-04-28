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


2.     DATA TYPES

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

# dev.tfvars and prod.tfvars are coustimised files and we need to pass the file for the output.

e. variable "auto_num1"
 
 # for the output of (auto.tfvars)  we no need to give any input/pass the file to the cloud shell. it will automatically runs this files and give the output.


f. variable "sample1"

# for terraform.tfvars we no need to pass the file, it will give output.


# terraform will always look for terraform.tfvars files and auto.tfvars files and run them, but for custom files like dev and prod we need to pass the files.


# terraform variable precedence.(order)
1. -var-file
2. *.auto.tfvars
3. terraform.tfvars
4. ask in cli to provide the input


# data sources are used for accessing some information which are already there.


# if we want a security group ID, then the data source is the one which help us to get.

# get the command from the inernet.

# as we know the name of the sg as "allow-all" we can search with the name for the ID.

data "aws_security_group" "selected" {
    name = "allow-all"
}

output = "security_group_id" {
    value = data.aws_security_group.selected.id
}



# what if terraform cant find the data source. it shows no matching security groups found will be output. for that we can use the "try" function. 

# we cant use this on the output as the issue is not coming on the output, this is the main probolem with the terraform.


# if we want to get all the security groups 

data "aws_security_groups" "test" {

}


# here we wont give the name as we want all and not any particular one

output "all_security_group" {
    value = data.aws_Security_groups.test
}




    LOOPS

# create a null resource and then see

resource "null_resource" "null" {}

and see the output 

# if we want to run the same resource 10 times then we have to give 

count = 10

resource "null_resource" "null" {
    count = 10
}


# # if we want to know the length of the function then we use 

count = lenght (var.resource name)

# if we want to deal with some inputs then we use the variables

variable "fruits" {
    default = [ "apple", "banana", "orange" ]
  
}

# provisioners is nothing but, after resource creation if we want to do some actions then we use the provisoners


# these are used to give the values of indiviuals(apple.banan etc)


 provisioner "local-exc" {
    command = "echo fruit name - ${var.fruits[count.index]}"
 }


# here we want the indiex valuw of these so we are using [count.index] and the wants the values of the variables fruits, so we use var.fruits.


