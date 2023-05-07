#  tfstate file 

# terraform is automatically creating tfstate files and storing the data.
# we recommend it in storing in the cloud
# terraform remote state is nothing but, terraform deals with these files


terraform {
  backend "s3" {
    bucket = "stagebuckets"
    key = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
    
  }
}

# this syntax is taken from the internet
# s3 is the state and stagebuckets is name of the bucket we created
# key is folder in which we wanted to create , here we use dev environment so given dev
# we can same code work in multi environment also
