# this block is used to call all the resources given in the other modules main.tf file
# we can call n number of resources at a single time using the module


module "sample" {
    source = "./module"
  
}