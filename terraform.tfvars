provider_config = {
  project_id = "my-first-project-298218",
  region = "us-central",
  zone = "us-central1-a",
  new_region = "us-east",
  new_zone = "us-east1-a"
}

count_vm_names = ["terraform-1","terraform-2"]
for_each_vm_names = ["terraform-3","terraform-4"]
tags = {
  "first" = "second" , 
  "third" = "fourth" 
}

ports = ["80" , "443" , "8080" , "1000-2000"]

vm_required = true