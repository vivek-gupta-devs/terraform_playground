terraform {}

# Number List
variable "number_list" {
  type    = list(number)
  default = [1, 2, 3, 4]
}


# Object list of person
variable "person_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [ {
    fname = "Michal"
    lname = "Clark"
  },
  {
    fname = "Sanju"
    lname = "Samson"
  } ]
}

# Map
# We should define output value data type
variable "map_list" {
  type = map(number)
  default = {
    "zero" = 0
    "one" = 1
    "two" = 2
  }
}


#Calculation
locals {
  mul = 2 * 2
  add = 2 + 2
  square = [ for num in var.number_list: num*num]
  odd =  [ for num in var.number_list: num if num%2 == 0]
  fnames = [for person in var.person_list : person.fname]

  map_info = [for key, value in var.map_list : value * value]
}


output "output" {
  value = local.map_info
}