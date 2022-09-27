extends State


func on_state_enter():
	print("Enter State: ", self.name)
	parent.animation_playback.travel(self.name)
	parent.max_speed *= 2

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
		state_manager.change_state("walking")
	
	parent.apply_movement()

func on_state_exit():
	print("Exiting state: ", self.name)
	parent.max_speed /= 2
