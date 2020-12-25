# Create a new instance of the latest Ubuntu 20.04 on t3.micro

provider "aws" {
  shared_credentials_file = file("~/.aws/credentials")
  region = var.region
}

data "aws_ami" "ubuntu_20_04" {
  owners = ["099720109477"] # Canonical .images
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu_20_04.id
  instance_type = "t3.micro"
  tags = {
    Owner = "Max Li"
    Status = "Temp"
    Project = "Hillel"
  }
  count = 1
}