variable "host_name" {
    description = "The name of the host"
    type        = string
}

variable "microservices" {
    description = "List of all microservices running on the smart home k3s cluster"
    type = list(string)
}