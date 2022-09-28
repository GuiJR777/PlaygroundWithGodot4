extends Control

@onready var pause_screen: Control = $pause_screen
@onready var state_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/state

var translated_states_map: Dictionary = {
	"idle": "Parado",
	"walking": "Andando",
	"running": "Correndo",
	"falling": "Caindo",
	"jump": "Pulando",
	"crouch": "Agachado",
	"crouch_walk": "Andando agachado",
}

func _process(delta):
	if get_tree().paused:
		pause_screen.show()
	else:
		pause_screen.hide()
	
	state_label.text = translated_states_map.get(PlayerData.current_state)
