#when creating an instance there needs to be a vpc for the instance to reside in
resource "aws_vpc" "main" {
cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "sub1" {
vpc_id = aws_vpc.main.id
cidr_block = "10.1.0.0/24"
availability_zone = "us-east-1a"
}

resource "aws_route_table" "public" {
vpc_id = aws_vpc.main.id
}

resource "aws_internet_gateway" "gw" {
vpc_id = aws_vpc.main.id
}


resource "aws_route" "public_internet_gateway" {
#count = "${length(local.public_subnets)}"
route_table_id = aws_route_table.public.id
destination_cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.gw.id

timeouts {
create = "5m"
}

}

resource "aws_route_table_association" "a" {
subnet_id = aws_subnet.sub1.id
route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "ssh" {
name = "testing-sg"
vpc_id = aws_vpc.main.id
#id = var.vpc_id
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}
