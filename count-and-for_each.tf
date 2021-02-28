resource "type" "name" {
  count = 2
  tag = {
    name = "customer-${count.index}"
    }
  }


resource "type" "name" {
  for_each = {
      food = "public"
      cash = "private"
    }
    bucket = "${each.key}-${var.suffix}"
  }
