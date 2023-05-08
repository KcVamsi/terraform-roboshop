#  tfstate file 

# terraform is automatically creating tfstate files and storing the data.
# we recommend it in storing in the cloud
# terraform remote state is nothing but, terraform deals with these files


# terraform {
#   backend "s3" {
#     bucket = "stagebuckets"
#     key = "roboshopproject/dev/terraform.tfstate"
#     region = "us-east-1"
    
#   }
# }

# this syntax is taken from the internet
# s3 is the state and stagebuckets is name of the bucket we created
# key is folder in which we wanted to create , here we use dev environment so given dev
# we can same code work in multi environment also
# remove all the things before using the state and see the difference and also remove all the tfstate files
# rm -f terraform.tfstate


# 1 st destroy all the files and then creates the state files
# we can see the tfstate file again the cloud of s3



# we will not have direct access to s3 buckets and terraform, they need to run through some tools whihc is like jenkins


   # JENKINS  (s27)

  # root user = sudo su -

# for installation of jeninks, go to jenikins.io
# curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# yum install 3 files
# systemctl enable and systemctl start jenkins.
#  opens on 8080 port
#in organisations  we dont run terraform on our wown, it has to be run throgh some systems, this way we no need to give access to the workstation, we give access to jenkins.
# in IAC we run through some automation not manually so we use jenkins
#  jenkins is used to manage jobs only, where as the run time will other server which is the workstation
# so the 1st job will be failure and for that we need to go to manage jenkins and go to manage nodes and clouds and add a new node

# we are having a terrafom code, and running in a authroised server where we have access, since it is authroised server we dont like providing access to this server because it wll create unwanted work on the server.
# so we are taking  a susyem ehich is jenkins, so go to jenkins and run the job on he partiualr server
# major reason for running the terraform in jenkins is the multi environemnt running is easy

#  how to deal with multi envi in command line is 

  # backend "s3" {
  #   bucket = "stagebuckets"
  #   key = "roboshopproject/dev/terraform.tfstate"
  #   region = "us-east-1"
    
  # }

# the above code is only providng particulary to the dev envirnmet
# so we use some other files and make it multi in command line
# env-prod and env-dev
# we make the above command empty as



terraform {
  backend "s3" {}
  
}


# we can get the output here also and in jenkins also but we always preffer the jenkins for it

# for getting on cmnd line we use - git pull, terraform init -backend-config-env-dev/state.tfvars

# 1st case
# for using the multi envi on jenkins we use same code in the place of terraform init which is 
# terraform init -backend-config-env-dev/state.tfvars
# terraform apply -auto -approve


#2nd case
# instead of using the dev and prod we can use the variable as $(env) in place of them and remove the apply part and see, it will run on the given environment automatically


# same wthe terraform apply also need mutli envi, so we create few files and move the variables inside the var.tf file




