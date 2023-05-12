resource "null_resource" "nothing" {
    provisioner "local-exec" {
    command = "echo hello world from module - input - ${var.input}"
    }
  
}

# local-exec is used

# here we are decalring the variables



# Inputs to the Module can be called by variable block

variable "input" {
  
}


