
resource "local_file" "test" {
  filename = "./test.txt"
  content = "create file with terraform"
}


resource "local_file" "abc" {
    filename= "./test-folder/abc.txt"
    content = "abc test file"
}