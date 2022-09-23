extends Control


func _on_back_button_up():
	get_tree().change_scene_to_file(Global.previous_scene)
