extends Control


func _on_back_button_up():
	Global.actual_page_index -= 1
	var destiny_page: String = Global.previous_scenes[Global.actual_page_index]
	Global.previous_scenes.pop_back()
	get_tree().change_scene_to_file(destiny_page)
