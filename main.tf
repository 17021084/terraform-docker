
resource "local_file" "test" {
  filename = "./test.txt"
  content = var.file_content["state2"]
}


resource "local_file" "abc" {
    filename= var.file_name
    content = "abc test file"
}


resource "random_pet" "test-pet" {
  prefix=  var.list_prefix[2]
  separator = "."
  length = var.pet_length
}