extends State


func on_state_enter():
	parent.animation_playback.travel(self.name)
	parent.max_speed = parent.max_running_speed

func on_state_update():
	if parent.in_air:
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("jump")
		
	if Input.is_action_just_pressed("crouch"):
		parent.animation_playback.travel("roll")
		await get_tree().create_timer(1.2).timeout
		parent.animation_playback.travel(self.name)
	
	if Input.is_action_just_released("run"):
		state_manager.change_state("walking")
	
	if not parent.is_moving:
		state_manager.change_state("idle")
	
	parent.apply_movement()
