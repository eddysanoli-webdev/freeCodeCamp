# Input variables
# Variables that will ask for a value when you do "terraform apply"
variable "host_os" {
  
    # Variable type
    # (Not mandatory, but strongly recommended to not confuse
    # other devs)
    type = string

    # Default value for the variable
    default = "windows"
}