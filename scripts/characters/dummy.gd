extends CharacterBody3D
class_name Dummy


@onready var _tree: AnimationTree = $humanoid/animation_tree
@onready var _playback: AnimationNodeStateMachinePlayback = _tree["parameters/playback"]

var _gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var _default_animation: String = "parado"


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= _gravity * delta
		_playback.travel("caindo")
	else:
		_playback.travel(_default_animation)
	move_and_slide()

func set_default_animation(animation_name: String) -> void:
	_default_animation = animation_name
