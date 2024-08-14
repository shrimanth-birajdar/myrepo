region  "us-east-1"

ami  "ami-04a81a99f5ec58529"

instance_type  "t2.micro" 

key_name  "myfirst.key"

tags = {
    Enviorment = "staging"
    owner = "pavan"    
  }
