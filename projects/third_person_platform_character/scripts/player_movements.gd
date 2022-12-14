extends CharacterBody3D
class_name PlayerMovements


@export var spring_arm: SpringArm3D = null
@export var pivot: Marker3D = null
@export var floor_distance_checker: RayCast3D = null
@export var max_walk_speed: float = 6
@export var max_running_speed: float = 16
@export var jump_impulse: float = 4.5
@export var acceleration: float = 70
@export var friction: float = 60
@export var air_friction: float = 10
@export var rotation_speed: float = 5
@export var controller_sensitivity: float = 3

var max_speed: float = 5.0
var gravity = -(ProjectSettings.get_setting("physics/3d/default_gravity"))
var input_vector: Vector3 = Vector3.ZERO
var direction: Vector3 = Vector3.ZERO
var physics_delta: float = 0
var is_moving: bool = false
var in_air: bool = false


func get_input_vector() -> void:
	var vector = Vector3.ZERO
	vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	vector.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	input_vector = vector.normalized() if vector.length() > 1 else vector
	
	
func get_direction() -> void:
	direction = (input_vector.x * transform.basis.x) + (input_vector.z * transform.basis.z)
	

func apply_movement() -> void:
	if direction != Vector3.ZERO:
		velocity.x = velocity.move_toward(direction * max_speed, acceleration * physics_delta).x
		velocity.z = velocity.move_toward(direction * max_speed, acceleration * physics_delta).z
		pivot.rotation.y = lerp_angle(pivot.rotation.y, atan2(-input_vector.x, -input_vector.z), rotation_speed * physics_delta)
		
func apply_friction() -> void:
	if direction == Vector3.ZERO:
		if is_on_floor():
			velocity = velocity.move_toward(Vector3.ZERO, friction * physics_delta)
		else:
			velocity.x = velocity.move_toward(Vector3.ZERO, air_friction * physics_delta).x
			velocity.z = velocity.move_toward(Vector3.ZERO, air_friction * physics_delta).z
		
func apply_gravity():
	velocity.y += gravity * physics_delta
	velocity.y = clamp(velocity.y, gravity, jump_impulse)
	
	
func apply_controller_rotation():
	var axis_vector = Vector2.ZERO
	axis_vector.x = Input.get_action_strength("look_right") - Input.get_action_strength("look_left")
	axis_vector.y = Input.get_action_strength("look_down") - Input.get_action_strength("look_up")
	
	if InputEventJoypadMotion:
		rotate_y(deg_to_rad(-axis_vector.x) * controller_sensitivity)
		spring_arm.rotate_x(deg_to_rad(-axis_vector.y) * controller_sensitivity)
		
func is_in_air() -> bool:
	if not floor_distance_checker.is_colliding():
		return true
		
	if floor_distance_checker.is_colliding() and not is_on_floor():
		var floor_position = floor_distance_checker.get_collision_point()
		var floor_distance = global_transform.origin.distance_to(floor_position)
		
		if floor_distance < 1:
			return false
		
		return true
	return false
