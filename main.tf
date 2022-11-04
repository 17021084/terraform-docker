
resource "local_file" "test" {
  filename = "./test.txt"
  content  = var.file_content["state2"]

  lifecycle {
    # TẠo cái mới trước khi cái cũ bị xoá
    # create_before_destroy = true

    # usecase là các resource liên quan tới db. 
    prevent_destroy = false

    # bỏ change một số thứ
    # ignore_changes = [
    #   content
    # ]
  }

}


resource "local_file" "abc" {
  filename = var.file_name
  content  = "pet  name is  ${random_pet.test-pet.prefix}    ${random_pet.test-pet.id} "
}


resource "random_pet" "test-pet" {
  prefix    = var.list_prefix[2]
  separator = "."
  length    = var.pet_length
}

output "pet_name" {
  value       = random_pet.test-pet.id
  sensitive   = false
  description = "print output pet"
}



# resource "local_file" "car" {
#   filename = "./cars/car-name"
#   content  = each.value
#   for_each = toset(var.cars)
# }



# output "car_output" {
#   value = local_file.car
#   sensitive = false
#   }



resource "local_file" "car" {
  # some how it work
  for_each = { for car in var.cars : car.filename=> car }
  filename = each.value.filename
  content  = each.value.content

}