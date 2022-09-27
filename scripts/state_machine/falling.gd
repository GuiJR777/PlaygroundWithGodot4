extends State


func on_state_update():
	if parent.is_moving:
		if parent.is_on_floor():
			state_manager.change_state("walking")
		parent.apply_movement()

	if parent.is_on_floor():
		state_manager.change_state("idle")
	
	parent.apply_friction()
		
