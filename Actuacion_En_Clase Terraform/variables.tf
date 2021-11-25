
variable "Region_Terraform" {
  default = "us-east-1"
}

variable "AZ_Zona" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "subnet_cidr" {
  type    = list(any)
  default = ["172.30.11.0/24", "172.30.12.0/24"]
}

variable "lista_subnet" {
  type    = list(string)
  default = ["aws_subnet.AZ_0_Subnet_e-Commerce", "aws_subnet.AZ_1_Subnet_e-Commerce"]
}

#Ip del Load Balancer
#output "lb_dns_name" {
#  description = "Nombre DNS del LB"
#  value       = aws_lb.LB_e-Commerce.dns_name
#}