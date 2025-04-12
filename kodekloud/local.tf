resource "local_file" "pet"{
	filename="./pets.txt"
	content="we love pets"
	}

resource "random_id" "my_pet"{
	byte_length=8
	type="pet"
	}
