ec2_config = [{
  ami           = "ami-084568db4383264d4" # Ubuntu
  instance_type = "t3.micro"
  },
  {
    ami           = "ami-0953476d60561c955" # Amazon,
    instance_type = "t3.micro"
}]


ec2_map = {
  #key=value
  "ubuntu" = {
    ami           = "ami-084568db4383264d4" # Ubuntu
    instance_type = "t3.micro"
  },
  "amazon-linux" = {
    ami           = "ami-0953476d60561c955" # Amazon,
    instance_type = "t3.micro"
  }
}
