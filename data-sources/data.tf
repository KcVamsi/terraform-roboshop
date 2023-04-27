data "aws_security_group" "allow-all" {
  name = "allow-all"
}

# as we know the name of the sg we are going with name otherwise we can go with the id also, but what we need here is id.

output "security_group_id" {
    value = data.aws_security_group.allow-all.id
}


# this is used if we want all the security groups

 data "aws_security_groups" "test"{

 }

output "all_Security_groups" {
    value = data.aws_security_groups.test
  
}

# but here we are getting all the ids of the sg's but not all the information about the groups.

