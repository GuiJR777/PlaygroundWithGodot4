extends State


func on_state_enter():
	print("Enter State: ", self.name)
	parent.animation_playback.travel(self.name)
	parent.max_speed = parent.max_running_speed

func on_state_update():
	if not parent.is_on_floor():
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("jump")
		
	if Input.is_action_just_pressed("crouch"):
		parent.animation_playback.travel("roll")
		await get_tree().create_timer(1.2).timeout
		parent.animation_playback.travel(self.name)
	
	if not parent.is_moving:
		state_manager.change_state("idle")
	
	parent.apply_movement()
