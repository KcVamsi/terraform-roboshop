# terraform-roboshop

# output block is resource and the name is frontend.

# we can reffer the resoruce by aws_instance.frontend.public.ip

# comnds for output - 
# output "frontend" {
#    value = aws_instance.frontend.public_ip
# }

# this gives th ip of the frontend.




# data block/source is used for inputs

# we are hardcoding the ami but it will change daily, so we use this.

# data "aws_ami" "centos" {
# owners           = ["973714476881"]
# most_recent      = true
# name_regex       = "Centos-8-DevOps-Practice"


# now we need output

# output "ami" {
#    value = data.aws_ami.centos.image_id
}