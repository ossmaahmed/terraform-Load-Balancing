
resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Security group for web server"
  vpc_id      = aws_vpc.vpc_1.id
  

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_1.cidr_block]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Security group for private instances"
  vpc_id      = aws_vpc.vpc_1.id
  

  ingress {
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    security_groups = [aws_security_group.web-sg.id]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
