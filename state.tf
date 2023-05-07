#  tfstate file 

# terraform is automatically creating tfstate files and storing the data.
# we recommend it in storing in the cloud
# terraform remote state is nothing but, terraform deals with these files


terraform {
  backend "s3" {
    bucket = "stagebuckets"
    key = "roboshopproject/dev/terraform.tfstate"
    region = "us-east-1"
    
  }
}

# this syntax is taken from the internet
# s3 is the state and stagebuckets is name of the bucket we created
# key is folder in which we wanted to create , here we use dev environment so given dev
# we can same code work in multi environment also
# remove all the things before using the state and see the difference and also remove all the tfstate files
# rm -f terraform.tfstate


# 1 st destroy all the files and then creates the state files
# we can see the tfstate file again the cloud of s3