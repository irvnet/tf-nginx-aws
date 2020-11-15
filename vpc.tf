# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/20"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"
  enable_classiclink   = "false"

  tags = {
    Name = "main"
  }
}

## -----------------------------

# Subnets
resource "aws_subnet" "main-public-01" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-public-01"
  }
}

resource "aws_subnet" "main-public-02" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "main-public-02"
  }
}

## -----------------------------
# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
}

# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }


}

# route associations public
resource "aws_route_table_association" "main-public-1a" {
  subnet_id      = aws_subnet.main-public-01.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-1c" {
  subnet_id      = aws_subnet.main-public-02.id
  route_table_id = aws_route_table.main-public.id
}
