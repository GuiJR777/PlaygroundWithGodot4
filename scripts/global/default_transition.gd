extends CanvasLayer

@onready var animation_player: AnimationPlayer = $animation

var scene_destiny: String = ""


func change_scene(target: String) -> void:
	visible = true
	scene_destiny = target
	_transition_dissolve()

func _transition_dissolve() -> void:
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(scene_destiny)
	animation_player.play_backwards("dissolve")
