# this is module block and is used to call all the resources given in the other modules main.tf file
# we can call n number of resources at a single time using the module


# module "sample" {
#     source = "./module"
  
# }


# if we want to give inputs to the module 


module "sample" {
    source = "./module"
    input = "assd"
  
}

# this input shuld be recieved by the module by using a variable module

