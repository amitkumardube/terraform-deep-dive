provider_config = {
  project_id = "my-first-project-298218",
  region = "us-central",
  zone = "us-central1-a"
}

count_vm_names = ["terraform-1","terraform-2"]
for_each_vm_names = ["terraform-3","terraform-4"]
tags = {
  "first" = "second" , 
  "third" = "fourth" 
}