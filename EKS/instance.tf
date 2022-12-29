resource "aws_instance" "Demo_Server" {
  count                  = 1
  ami                    = "ami-02045ebddb047018b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = element(aws_subnet.public.*.id, count.index)
  key_name               = "devops"
  associate_public_ip_address = true

  tags = {
    Name = "UbuntuServer"
    Type = "Docker"
  }

}