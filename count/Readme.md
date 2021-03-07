# Count Meta Argument

- This is used to loop over resources.
- It works best with list as you can access the list value using index by passing count.index.
- Considering that the resources created through count will have same type and name for terraform - they are differentiated by their index.
- In the example we will use google_compute_instance.default[0].name and google_compute_instance.default[1].name to refer both the instances individually.
- If we need to all the instances as list , this can be returned by google_compute_instance.default[*].name
- `count` mega-argument is available since very early version of terraform.
- Once you use count in a resource it becomes a list of resources.