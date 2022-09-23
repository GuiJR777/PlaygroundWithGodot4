extends Control


@onready var animation: AnimationPlayer = $animation_player
@onready var fullscreen_button: TextureButton = $MarginContainer/HBoxContainer2/fullscreen
@onready var close_label: Label = $MarginContainer/HBoxContainer2/close/hint
@onready var fullscreen_label: Label = $MarginContainer/HBoxContainer2/fullscreen/hint

var can_acess: bool = false
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


func _ready():
	animation.play("start")

func _update_button_texture() -> void:
	var key = ""
	
	if is_fullscreen:
		key = "fullscreen"
	else:
		key = "windowed"
		
	var texture_map = fullscreen_button_textures.get(key)
	fullscreen_button.texture_normal = texture_map.get("normal")
	fullscreen_button.texture_hover = texture_map.get("hover")
	


func _on_animation_player_animation_finished(_anim_name):
	can_acess = true


func _on_projects_button_button_up():
	if can_acess:
		print("Vai pra tela de projetos")


func _on_minigames_button_button_up():
	if can_acess:
		print("Vai pra tela de mini-games")


func _on_close_button_up():
	if can_acess:
		get_tree().quit()


func _on_fullscreen_button_up():
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		fullscreen_label.text = "Maximizar"
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen_label.text = "Minimizar"
	is_fullscreen = !is_fullscreen
	_update_button_texture()


func _on_close_mouse_entered():
	close_label.visible = true


func _on_close_mouse_exited():
	close_label.visible = false


func _on_fullscreen_mouse_entered():
	fullscreen_label.visible = true


func _on_fullscreen_mouse_exited():
	fullscreen_label.visible = false
