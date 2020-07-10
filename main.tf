provider "aws" {
  region  = "us-west-2"
}

resource "random_integer" "count" {
  min = 4
  max = 20
  keepers = {
    uuid = uuid()
  }
}
resource "random_pet" "server" {
  length = random_integer.count.result
}


#resource "aws_instance" "basic" {
#  ami           = "ami-62131702"
#  instance_type = "t3.nano"
#}
