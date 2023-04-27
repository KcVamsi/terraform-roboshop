data "aws_security_group" "selected" {
  name = "allow-all"
}

# as we know the name of the sg we are going with name otherwise we can go with the id also, but what we need here is id.

output  "security_group_id" {
    value = data.aws_security_group.selected.id
}

