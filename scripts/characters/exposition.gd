extends CharacterBody3D


const ANIMATION_TREE_INDEX: int = 2

@onready var body: Node3D = $body

@onready var _tree: AnimationTree = $body/animation_tree
@onready var _playback: AnimationNodeStateMachinePlayback = _tree["parameters/playback"]

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
		_playback.travel("jump")
	else:
		_playback.travel("idle")
	move_and_slide()
	
	
	
