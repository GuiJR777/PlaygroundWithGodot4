extends SpringArm3D


@onready var parent = get_parent()

@export var mouse_sensivity: float = 0.1

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _unhandled_input(event):
	var is_mouse_hidden: bool = Input.mouse_mode == Input.MOUSE_MODE_HIDDEN
	
	if event.is_action_pressed("click"):
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	if event.is_action_pressed("toggle_mouse_capture"):
		if is_mouse_hidden:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	if event is InputEventMouseMotion and is_mouse_hidden:
		var angle_to_rotate_body = deg_to_rad(-event.relative.x * mouse_sensivity)
		var angle_to_rotate_camera = deg_to_rad(-event.relative.y * mouse_sensivity)
		
		parent.rotate_y(angle_to_rotate_body)
		rotate_x(angle_to_rotate_camera)
		rotation.x = clamp(rotation.x, deg_to_rad(-75), deg_to_rad(75))
