extends Control


func _on_pause_button_up():
	get_tree().paused = !get_tree().paused
