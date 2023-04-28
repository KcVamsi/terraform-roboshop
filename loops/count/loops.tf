#just create a null resource and see the output

#resource "null_resource" "null" {
    #count = 10
#}




# if we wanto to create 10 servers the nwe can use this.

# if we want to know the length of the function then we use 


resource "null_resource" "fruits" {
  count = length(var.fruits)
}

# we use provisioners after the resources and we can use at any place after the resource creation.

provisioner "some-name" {
  command = "echo fruit name - ${var.fruits[count.index]}"

}
# if we want to deal with some inputs then we use the variables

variable "fruits" {
    default = [ "apple", "banana", "orange" ]
  
}

# we use provisioners after the resources and we can use at any place after the resource creation.