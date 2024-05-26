variable "ami_id" {
    default = "ami-0f3c7d07486cad139"
}
variable "instance_type" {
    default = "t2.micro"
}
# variable "sg_cidr"{
#     default = "0.0.0.0/0"
# }

variable "instnaces" {
  type = map
  default = {
    MongoDD = "t3.medium"
    MySQL = "t3.medium"
    rabbitMQ = "t2.micro"
    catalogue = "t2.micro"
    redis = "t2.micro"
    payment = "t2.micro"
    shipping = "t2.micro"
    cart = "t2.micro"
    web = "t2.micro"
    user = "t2.micro"
  }
}

variable "zone_id" {
    default = "Z097673937ONJ4SZ9QK2T"
}

variable "domain" {
    default = "laksh.site"
}

variable "ingress" {
    type = list
    default = [{
            from_port = 80
            to_port = 80
            description = "allow port 80"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "allow port 443"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "allow port 22"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }        
    ]
  
}