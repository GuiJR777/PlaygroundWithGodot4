extends State


func on_state_update():
	if parent.is_moving and parent.is_on_floor():
		state_manager.change_state("running")
	elif not parent.is_moving and parent.is_on_floor():
		state_manager.change_state("idle")
	elif parent.is_moving and not parent.is_on_floor():
		parent.apply_movement()
	else:
		parent.apply_friction()
		
