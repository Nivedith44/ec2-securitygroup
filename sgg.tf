provider "aws" {
    region = "eu-west-2"
    access_key = "your access key"
    secret_key = "your secrete access key"
}
resource "aws_instance" "nive" {
    instance_type = "t2.micro"
    availability_zone = "eu-west-2a"
    ami = "ami-0500f74cc2b89fb6b"
    vpc_security_group_ids = [aws_security_group.nivsg.id]
    count = 2
}
resource "aws_security_group" "nivsg" {
  name = "niv12"
  ingress {
    description = "HTTP"
    protocol  = "tcp"
    self      = true
    from_port = 80
    to_port   = 80
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
