# variable "ami_id" {
#     default = "ami-0f3c7d07486cad139"
# }
variable "instance_type" {
    default = "t2.micro"
}
variable "sg_cidr"{
    default = "0.0.0.0/0"
}

variable "intance_names" {
    type = list
    default = ["ab","bd","cf","gt"]  
}

variable "zone_id" {
    default = "Z097673937ONJ4SZ9QK2T"
}

variable "domain" {
    default = "laksh.site"
}