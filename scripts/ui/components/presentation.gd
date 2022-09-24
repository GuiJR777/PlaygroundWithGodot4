extends ColorRect


func _ready():
	await get_tree().create_timer(1).timeout
	$animation.play("start")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/leveis/main_menu.tscn")
