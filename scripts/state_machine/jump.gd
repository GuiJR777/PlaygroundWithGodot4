extends State


func on_state_update():
	if parent.velocity.y <= 0:
		state_manager.change_state("falling")

	if parent.is_moving:
		parent.apply_movement()
	
	if Input.is_action_just_released("jump") and parent.velocity.y > parent.jump_impulse / 2:
		parent.velocity.y = parent.jump_impulse / 2
	else:
		parent.velocity.y = parent.jump_impulse
