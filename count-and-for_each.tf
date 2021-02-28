# this will run 2 times adding customer-0 and customer-1 from index
resource "type" "name" {
  count = 2
  tag = {
    name = "customer-${count.index}"
    }
  }

# this will run 2 times for each key
resource "type" "name" {
  for_each = {
      food = "public"
      cash = "private"
    }
    bucket = "${each.key}-${var.suffix}"
  }
