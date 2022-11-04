
variable "pet_length" {
  default = 2
}


# instate of this, use  terraform.tfvars
variable "file_name" {
  default     = "./variable/test-variable.txt"
  type        = string
  description = "value of part"
}

variable "list_prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type    = list(any)
}

variable "file_content" {
  type = map(any)
  default = {
    "state1" = "we hate pet"
    "state2" = "dame"
  }
}

variable "animals" {
  type    = tuple([string, number, bool])
  default = ["cat", 1, true]
}
