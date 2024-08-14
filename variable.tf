#variable block calling all values
variable = "us-east-1"{
    
    description = "region calling"
}

variable = "ami-04a81a99f5ec58529"{
    
    description = "calling ami"
}

variable = "t2.micro" {

  description = "calling instance type"
}

variable = "myfirst.key" {

    description = "calling key-pair"
}

variable = "tags" {
    type = map
     {
     Name = "Development-server"
     Enviorment = "staging"
     Owner = "shri"
    # }
}
