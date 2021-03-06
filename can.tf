### Test scenario for "can"
variable "word-length" {
  default = 7

  validation {
    # The condition here identifies if the integer if greater than 1
    condition = var.word-length > 1
    error_message = "The variable is not greater than 5. Word length has to be at a minimum > 1."
  }
}

variable "os" {
  default = "linux"

  validation {
    # The condition here identifies if the variable contains the string "linxu" OR "windows".
    condition = can(regex("linux|windows", var.os))
    error_message = "ERROR: Operating System must be Windows OR Linux."
  }
}

resource "random_pet" "pet" {
  length = var.word-length
  keepers = {
    pet-name = timestamp()
  }
}


output "pet" {
  value = "${random_pet.pet.id}"
}
