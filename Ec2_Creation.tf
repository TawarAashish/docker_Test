# Configure AWS Provider
provider "aws" {
  region = "ap-south-1" # You can change it to your preferred region
}

resource "aws_instance" "Docker" {
  ami                    = "ami-0f559c3642608c138"
  instance_type          = "m7i-flex.large" # You can change it according to your need
  count                  = 1
  key_name               = "Docker" # change if key name is different in aws account
  subnet_id              = "subnet-02697f5a55cf27186"                  # Change it with your subnet id
  vpc_security_group_ids = ["sg-04cbb0892016a8a94"]                    # Change it with your security group
  tags = {
    Name = "Docker-ec2"
  }
}

output "ec2_public_ips" {
  value = aws_instance.Docker[*].public_ip
}
