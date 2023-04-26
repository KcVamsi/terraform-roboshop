variable "sample_string" {
    default = "hello world"
  
}

# we keep these outputs in the output.tf file as the terraform will run all the files in the folder at a time.data "

variable "sample_number" {
    default = 1909
  
}

variable "sample_boolean" {
    default = true
  
}


variable "sample_list" {
    default = [
        100,
        "hello"
        true,
        123
        1405.4
    ]
}




