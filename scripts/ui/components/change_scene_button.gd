extends Control

@export var scene_destiny_path: String = ""


func _on_change_scene_button_up():
	var selected_scene = get_tree().get_current_scene().get_scene_file_path()
	Global.actual_page_index += 1
	Global.previous_scenes.append(selected_scene)
	DefaultTransition.change_scene(scene_destiny_path)
