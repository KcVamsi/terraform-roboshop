#just create a null resource and see the output

resource "null_resource" "null" {
    count = 10
}


