extends State


func on_state_update():
	if parent.is_moving:
		if parent.is_on_floor():
			print("Andando")
		else:
			print("Movendo no ar")

	if parent.is_on_floor():
		state_manager.change_state("idle")
		
