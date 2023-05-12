resource "null_resource" "nothing" {
    provisioner "local-exec" {
    command = "echo hello world from module"
    }
  
}

# local-exec is used

# here we are decalring the variables

