extends Control

@onready var text_hint: Label = get_node("VBoxContainer/hint")

@export var text: String = "Texto de Ajuda"


func  _ready():
	text_hint.text = text
	


func _on_button_mouse_entered():
	text_hint.visible = true


func _on_button_mouse_exited():
	text_hint.visible = false
