# terraform-roboshop

# output block is resource and the name is frontend.

# we can reffer the resoruce by aws_instance.frontend.public.ip

# comnds for output - 
 output "frontend" {
    value = aws_instance.frontend.public_ip
 }

# this gives th ip of the frontend.




# data block/source is used for inputs

# we are hardcoding the ami but it will change daily, so we use this.

data "aws_ami" "centos" {
owners           = ["973714476881"]
most_recent      = true
name_regex       = "Centos-8-DevOps-Practice"


# now we need output

 output "ami" {
    value = data.aws_ami.centos.image_id
}




# dns record creation - how to create

# go to route53 create record terraform in google and get the code

#resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}

