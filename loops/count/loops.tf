# 1 # just create a null resource and see the output

# resource "null_resource" "null" {
#     count = 10
# }

# if we want to run the same thing few times then we use the  count 
# if we wanto to create 10 servers then we can use this.


# 2 # if we want to know the length of the function then we use 
# count = lenght(var.fruits) gives the length.
# lenght is going to calaclute how many values are there in the and runs those many times.

resource "null_resource" "fruits" {
  count = length(var.fruits)




# 3 # if we want to deal with some inputs then we use the variables

# variable "fruits" {
#     default = [ "apple", "banana", "orange" ]
  
# }



# 4 # if want the value of apple ,banan etc then we use provisioners.
# we use provisioners after the resources and we can use at any place after the resource creation.


 provisioner "local-exec" {
  command = "echo fruit name - ${var.fruits[count.index]}"
 }

 }


# for provisoners to get effected we use the teeraform destroy comnnadn 1st and then apply.
# here we use "echo ${}" because we have combination of variables and string.
# [count.index] is used to pick the value one by one and gives the index number.
# so after the resource instead of variables we use the provisoners and then variables

variable "fruits" {
    default = [ "apple", "banana", "orange" ]
  
}

# [ apple ,etc ] this is the example of list
# now we use this in the roboshop where we create instances / components.
# count is very less used loop and most used is the for each loop


