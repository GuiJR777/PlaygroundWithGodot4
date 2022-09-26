class_name ThirdPersonCharacter
extends CharacterBody3D


@onready var _animation_tree: AnimationTree = $humanoid/animation_tree
@onready var animation_playback: AnimationNodeStateMachinePlayback = _animation_tree["parameters/playback"]

@export var movement_speed: float = 5.0
@export var jump_impulse: float = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var is_moving: bool = false
var use_gravity: bool = true


func _physics_process(delta):
	if use_gravity:
		apply_gravity(delta)
	
	if get_movement_direction():
		is_moving = true
	else:
		is_moving = false
	
	move_and_slide()


func apply_gravity(delta) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

func jump() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_impulse

func apply_horizontal_move() -> void:
	var direction = get_movement_direction()

	if direction:
		velocity.x = direction.x * movement_speed
		velocity.z = direction.z * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.z = move_toward(velocity.z, 0, movement_speed)

func get_movement_direction() -> Vector3:
	var input_direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_backward",
	)
	return (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
