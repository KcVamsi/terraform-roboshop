components = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
  
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    
    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }
    redis = {
      name = "redis"
      instance_type = "t3.small"
    }
    user = {
      name = "user"
      instance_type = "t3.small"
    }
    cart = {
      name = "cart"
      instance_type = "t3.small"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.small"
    }

    shipping = {
      name = "shipping"
      instance_type = "t3.small"
    }

    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
    }
}

# now we need to declare the env and prod variables for that we create a vars.tf file

