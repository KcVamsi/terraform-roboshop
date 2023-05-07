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

# deafualt is a map and in that we key as apple and value as 1
# but in real time we will have many inputs in the variables
# for that we have a new example as

resource "null_resource" "fruit" {
  for_each = var.fruit

provisioner "local-exec" {
    command = "echo fruit-name ${each.key} - ${each.value["count"]}"
  
}
}

# here we are using the ["count"] beacuse here each.key means we get apple but each.value we again have a map instead of value so in that map we need a value so we use the count
# deafult is a map and apple is a key and in that again we have a map so we use count for getting the value in that map



variable "fruit" {
    default = {
         apple = {
            name = "apple"
            count = 12

        }

        orange = {
            name = "orange"
            count = 23
        }

        banana = {
            name= "banana"
            count = 45
        }
    }
  
}

# strings should always be in "" only
