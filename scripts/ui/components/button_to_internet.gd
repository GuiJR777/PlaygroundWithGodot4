extends Control

@onready var text_hint: Label = $VBoxContainer/hint
@onready var button: TextureButton = $VBoxContainer/button

@export var text_help: String = ""
@export var normal_image: Texture = null
@export var hover_image: Texture = null
@export var destiny_url: String = ""


func  _ready():
	text_hint.text = text_help
	button.texture_normal = normal_image
	button.texture_hover = hover_image

func _go_to_website(uri: String) -> void:
	OS.shell_open(uri)


func _on_button_mouse_entered():
	text_hint.visible = true


func _on_button_mouse_exited():
	text_hint.visible = false


func _on_button_pressed():
	_go_to_website(destiny_url)
