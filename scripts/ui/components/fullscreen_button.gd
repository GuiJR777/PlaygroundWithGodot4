extends Control

@onready var fullscreen_button: TextureButton = get_node("fullscreen/VBoxContainer/button")
@onready var fullscreen_label: Label = get_node("fullscreen/VBoxContainer/hint")

var is_fullscreen: bool = true

var fullscreen_button_textures: Dictionary = {
	"fullscreen": {
		"normal": preload("res://assets/UI/gameicons/PNG/Black/2x/smaller.png"),
		"hover": preload("res://assets/UI/gameicons/PNG/White/2x/smaller.png"),
	},
	"windowed": {
		"normal": preload("res://assets/UI/gameicons/PNG/Black/2x/larger.png"),
		"hover": preload("res://assets/UI/gameicons/PNG/White/2x/larger.png"),
	},
}

func _update_button_texture() -> void:
	var key = ""
	
	if is_fullscreen:
		key = "fullscreen"
	else:
		key = "windowed"
		
	var texture_map = fullscreen_button_textures.get(key)
	fullscreen_button.texture_normal = texture_map.get("normal")
	fullscreen_button.texture_hover = texture_map.get("hover")


func _on_fullscreen_button_up():
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		fullscreen_label.text = "Maximizar"
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen_label.text = "Minimizar"
	is_fullscreen = !is_fullscreen
	_update_button_texture()
