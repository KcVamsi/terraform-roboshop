if we want to create a server we reach out to cli, ui and terraform.
now we are using the terraform to connect with the server. for that we need some api credentials and that will connect to aws.
for that we need to create an machine with name workstation
we need to authenticate to the machine which is workstation, now we need credentialsfor that.
go to ROLES in IAM and create a role for the ec2 and give admin access to that and name the role as workstation-role and create it.
now we created a role, that role needs to be given to the workstation. for that go the workstation and right click on it and go to security and and then to modify IAM role and add that to the workstation.
to check whether we got the creds or not to the workstation, go to shell and type " aws ec2 describe-instances"



Installing terraform for linux from the online by running the commands.
terraform is IAC tool. in terraform we go with hcl.


change the hostname - "sudo set-hostname workstation"


in HCL we write everything in a block.


                  EXAMPLE 1 : create ec2 service terraform

search for this in the web we will get some example code
this code is called as resource creation as we are creating the resource




resource "aws_instance" "web" {
  ami           = ami-0b5a2b5b8f2be4ec2
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}




here "web" is the name of the resource
HelloWorld is name of the instance
here we need the ami id, we can get from the workstation machine or from the devops-practice and check under the centos 8.

key = value
key is ami and ami id is the value.


we can run the terraform as terraform init, terraform plan, terraform apply.



## with this approach of creating a server we can create roboshop servers.

use the same code 10 times if we want to create 10 instances in a separate folder with .tf extension.
it will create all the instances.


           ATTRIBUTES  vs ARGUMENTS

ARGUMENTS are inputs
ATTRIBUTES are outputs   




output "frontend" {
  value = aws_instance.frontend.public_ip

}


as we want the output as frontend ip we are giving frontend in the output


             DATA BLOCK  

If we want any input then data sources will come
here we are using the AMI of centos many times and it will change daily from one to other

                     EXAMPLE 2 




data "aws_ami" "centos" {
owners           = ["973714476881"]
most_recent      = true
name_regex       = "Centos-8-DevOps-Practice"
}




we will get the owner of the image from the  launch instance in devops practice  and reset the same


output "ami" {
  value = data.aws_ami.centos.image_id
}

as we want the output as am iwe are giving ami in the output
and we are using the data block so we are giving the value = data.

so we can remove the output block from the resource block and output block
and instaed of hardcoding the emi we use the " data.aws_ami.centos.image_id " in the place of ami id in the resource block





         DNS CREATION

after server creation we need to create dns record.
search for the route 53 terraform in web and use the code




resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "frontend.dev.rdevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_frontend.private_ip]
}




we will get the hosted zone id in route 35
name will be given by us as - "frontend.dev.rdevopsb72.online"
we create dns by "private_ip"
time should be less
copy paste the same code after the every instance.



                                                        TOPICS IN TERRAFORM 

             1. VARIABLES

# how to declare a variable.

a. variable "sample_string" {
default = "hello world"
}


# here "sample_string" is the name of the variable. we are declaring it.

# "hello world" is the output we need, for that we use default.

## these 2 lines are equal to sample_String="hello world" in shell scripting

# in terraform for varibale we are giving a name and for the output also we need to give a name.

# how do we access our variable or print the output is -

output "sample_string" {
value = var.sample_string
}

sample_string is the name of the output and we refer the variables as var.variable name which is var.sample_String

## these 2 lines are equal to echo=$sample_string in shell scripting

# in the above case we are just printing variable. if variable is a combination of strings then we use this syntax

output "sample_string1" {
    value = "${var.sample_string}"
}

# ${} is mandatory if we want to print the variables with string.


# check the var.tf file for handson.

# how do we use this declaring variable knowledge in roboshop is - we delcare a variable with name instance_type for creating instance type of t3.micro.



variable "instance_type" {
  default = "t3.micro"
  
}

# if we want to change them in future at a time we can use this. to access this or print this in the instances we use  - instance_type = var.instance_type in the instance creation variable block.

resource "aws_instance" "components" {
  count = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type









                    2.DATA TYPES

# string, number, boolean

# booleans are true or false.

# booleans and numbers doesnt need to be double quoted.

# only strings needs to be double quoted.


# terraform doesnt support the single quotes.



1. variable "sample string" {
    default = "hello world"
}


2. variable "sample_number" {
    default = 100.9
}


3. variable "sample_boolean" {
    deafult = true
}



            3.TYPES OF VARIABLES

# till now we have seen a default one but we have others


     a.   LIST VARIABLE TYPE - which means single variable can hold mulitple values.


 variable "sample_list" {
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

# "the list value starts from 0" 



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


# here we are giving keys to the same values of the list, so that we can access with the help of keys.

# this is the most preffered variable over the list variable beacuse here we dont need to follow any order when we declare the date, we can use them at any place.


to print or access the dictonary or map

output "sample_dict_number1" {
  value = var.sample_dict["number1"]
  
} 



# every time we cant hard code the data like list and maps, some times we need to give values dynamically



#  till now we are giving the inputs before only, if we want to give dynamically then we use "dev.tfvars" and "prod.tfvars"


# for dynamically passing the values we declare a empty variable means no default values - "dev.tfvars" and "prod.tfvars"

d. variable "env" {

} 

output "env" {
  value = var.env
  
}

 # in cloud shell for getting the dev output we use "terraform apply -var-file=dev.tfvars" and for the prod output we use "terraform apply -var-file=prod.tfvars"

# dev.tfvars and prod.tfvars are coustimised files and we need to pass the file for the output.

# these are used when we want to use in multi environment like dev and prod.




e. variable "auto_num1" {

}


output "auto_num1" {
  value = var.auto_num1

}
 
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



