# # as we know the name of the sg we are going with name otherwise we can go with the id also, but what we need here is id.

data "aws_security_group" "allow-all" {
  name = "allow-all"
}


output "aws_security_group" {
  value = data.aws_security_group.allow-all.id

}

 # as we want the value of id we use .id in the value.

 

