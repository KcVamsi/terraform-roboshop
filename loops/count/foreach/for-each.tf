# 5 # for each loop


# after 2 we use the for each loop command
# instead of count we use the for each loop
 resource "null_resource" "fruits" {

  for_each = var.fruits

provisioner "local-exec" {
  command = "echo Fruit name - ${each.key} - ${each.value}"
 
}
 }

# echo is used to print the output as fruit name and rest
# ${ } is used when we use string and variable
# as we want key and value we use two times like each.key , each.value
# using the same example in map of map type and if we use the same cmnd it will not give output because it is list value and it is also not a string it is just a declaration
# this is having both keys and values, most of the times this only comes
# key = value   ( this is the syntax for the above)



variable "fruits" {
    default = {
      apple = 1
      banana = 2
      orange = 3
    }
}