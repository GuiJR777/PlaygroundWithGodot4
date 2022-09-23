extends Control

@export var scene_destiny_path: String = ""


func _on_change_scene_button_up():
	Global.previous_scene = get_path_to(get_tree().current_scene)
	get_tree().change_scene_to_file(scene_destiny_path)
