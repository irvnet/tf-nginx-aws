
resource "aws_instance" "websrv-02" {
  ami           = "ami-08b277333b9511393"
  instance_type = "t2.micro"

  root_block_device {
     volume_size = 20
   }

  # the VPC subnet
  subnet_id = aws_subnet.main-public-02.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = "deployer-key"

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
    private_key = file("${path.module}/keys/demo-1")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y upgrade",
      "sudo apt-get -y install nginx",
      "sudo service nginx start"
    ]
  }

  tags = {
      Name      = "webserver-02"
      proj      = "webserver"
      terraform = true
      env       = "test"
  }


}
