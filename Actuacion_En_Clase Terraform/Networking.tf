
#Creacion de VPC y Gateway

resource "aws_vpc" "vpc_1" {
  cidr_block           = "172.30.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name        = "vpc_1"
    Description = "VPC Solucion 1"
  }
}

resource "aws_internet_gateway" "GW_vpc_1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "GW-VPC Solucion 1"
  }
}


resource "aws_subnet" "Subnet_ALB" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = "172.30.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "Subnet_ALB"
    Description = "Subnet del ALB"
  }

}


resource "aws_route_table" "tabla_vpc_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW_vpc_1.id
  }

  tags = {
    Name = "Tabla de rutas vpc_1"
  }
}

resource "aws_main_route_table_association" "Main_tabla_1" {
  vpc_id         = aws_vpc.vpc_1.id
  route_table_id = aws_route_table.tabla_vpc_1.id
}