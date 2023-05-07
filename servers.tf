# 1 # here we are using the AMI of centos-8 many times and it will change daily from one to other
# we get this code from the web
data "aws_ami" "centos" {
owners           = ["973714476881"]
most_recent      = true
name_regex       = "Centos-8-DevOps-Practice"
}




#2 # sg is important for all instances bcz without that we cannt communicate with the instances.

data "aws_security_group" "allow-all" {
  name = "allow-all"
  
}

# for adding the sg to the instance we use this code in the resouce blocks

# vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]





#3 # for creating the instances we use this syntax

# variable "instance_type" {
#   default = "t3.micro"
  
# }



# we use this instance type in the resources where we are using the code as instance_type = var.instance_type
# before it was like instance_type = t3.micro but if we wanto to change in all instances at a time we use var.instance_type
# therefore if we change in default one then every where it will change



# 4 # creating the instances for roboshop 
# resource "aws_instance" "frontend" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "frontend"
#   }
# }


# resource "aws_route53_record" "frontend" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "frontend.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.frontend.private_ip]
# }

# # here we use private_ip as we are connecting to internal servers.


# resource "aws_instance" "mongodb" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "mongodb"
#   }
# }

# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "mongodb.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mongodb.private_ip]
# }



# resource "aws_instance" "catalogue" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "catalogue"
#   }
# }

# resource "aws_route53_record" "catalogue" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "catalogue.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.catalogue.private_ip]
# }



# resource "aws_instance" "redis" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "reddis"
#   }
# }

# resource "aws_route53_record" "redis" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "redis.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.redis.private_ip]
# }


# resource "aws_instance" "user" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "user"
#   }
# }

# resource "aws_route53_record" "user" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "user.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.user.private_ip]
# }



# resource "aws_instance" "cart" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "cart"
#   }
# }

# resource "aws_route53_record" "cart" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "cart.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.cart.private_ip]
# }


# resource "aws_instance" "mysql" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "mysql"
#   }
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "mysql.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mysql.private_ip]
# }


# resource "aws_instance" "shipping" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "shipping"
#   }
# }

# resource "aws_route53_record" "shipping" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "shipping.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.shipping.private_ip]
# }


# resource "aws_instance" "rabbitmq" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "rabbitmq"
#   }
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "rabbitmq.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.rabbitmq.private_ip]
# }


# resource "aws_instance" "payment" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "payment"
#   }
# }

# resource "aws_route53_record" "payment" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "payment.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.payment.private_ip]
# }


# resource "aws_instance" "dispatch" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = "dispatch"
#   }
# }

# resource "aws_route53_record" "dispatch" {
#   zone_id = "Z01467732RXIXT52PMHO"
#   name    = "dispatch.devopsdomain1.online"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.dispatch.private_ip]
# }



# 5 #   instead creating one by one we use variable for the components and create all at a time
#  after 1,2 and 3 we use this.


# 1 is data aws_ami centos
# 2 is data security_group
# 3 is variable isntance

# variable "components" {
#   default = [ "frontend", "mongodb", "catalogue" ]
# }

# resource "aws_instance" "instance" {
#   count         = length(var.components)
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

#   tags = {
#     Name = var.components[count.index]
#   }
# }


# we use count in the resorce block as it has to run how many times we give/use.


# 6 #  instead of using the instance type and components block we can directly keep them in a for each loop
# now we use the for_each in roboshop
# we replace the - variable "instance_type" {
#  default = "t3.micro"
  
# we replace the  - variable "components" {
# default = [ "frontend", "mongodb", "catalogue" ] and directly use this

variable "components" {
  default = {
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
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}

