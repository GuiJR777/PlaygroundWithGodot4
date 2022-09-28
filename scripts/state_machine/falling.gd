extends State


func on_state_update():
	if parent.is_moving and not parent.in_air:
		state_manager.change_state("walking")
	elif not parent.is_moving and not parent.in_air:
		state_manager.change_state("idle")
	elif parent.is_moving and parent.in_air:
		parent.apply_movement()
	else:
		parent.apply_friction()
		
