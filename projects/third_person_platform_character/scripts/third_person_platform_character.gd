extends PlayerMovements
class_name ThirdPersonCharacter


@onready var _animation_tree: AnimationTree = $pivot/humanoid/animation_tree
@onready var animation_playback: AnimationNodeStateMachinePlayback = _animation_tree["parameters/playback"]

@export var use_gravity: bool = true



func _ready():
	var body: HumanoidBody = $pivot/humanoid
	body.set_skin(PlayerData.current_skin)
	max_speed = max_walk_speed
	
	spring_arm = $SpringArm3d
	pivot = $pivot


func _physics_process(delta):
	physics_delta = delta
	
	in_air = is_in_air()
	
	apply_controller_rotation()
	get_input_vector()
	get_direction()
	
	if use_gravity:
		apply_gravity()
	
	if direction != Vector3.ZERO:
		is_moving = true
	else:
		is_moving = false
		
	move_and_slide()
	
