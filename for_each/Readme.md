# For Each Meta Argument

- This is used to loop over entire resource or inline block within a resource.
- It works with list , set and map. 
- It returns the map of resources.
- In the example we will use google_compute_instance.default[key1].name and google_compute_instance.default[key2].name to refer both the instances individually.
- If we need to all the instances as list , this can be returned by google_compute_instance.default[*].name
- `for_each` mega-argument is introduced in 0.12 version of terraform.
- Once you use `for_each` in a resource it becomes a map of resources.
