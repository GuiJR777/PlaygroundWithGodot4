extends HBoxContainer
class_name SkinSelectionControl


const PATH_TO_SKINS: String = "res://Assets/3D_characters/skins/"
const TEXTURE_EXTENSION: String = ".png"

@onready var skin_class_label: Label = $HBoxContainer/VBoxContainer/TextureRect/MarginContainer/VBoxContainer/class_selection/skin_class
@onready var variation_skin_label: Label = $HBoxContainer/VBoxContainer/TextureRect/MarginContainer/VBoxContainer/variation_selection/variation
@onready var animation_label: Label = $HBoxContainer/VBoxContainer/TextureRect/MarginContainer/VBoxContainer/animation_selection/animation

var character_reference: Dummy = null

var skin_classes: Array = []
var skin_variations: Array = []
var animations: Array = [
	"parado",
	"andando",
	"polichinelos",
	"dançando",
	"zumbi"
]

var actual_skin_class_index: int = 0
var actual_variation_index: int = 0
var actual_animation_index: int = 0

var selected_skin_class: String = ""
var selected_variation: String = ""
var selected_texture: String = ""
var selected_animation: String = ""


func _ready():
	character_reference = get_tree().get_first_node_in_group("dummy")
	
	skin_classes = Constants.SKINS_MAP.keys()
	_update_values()

func _update_values() -> void:
	selected_skin_class = skin_classes[actual_skin_class_index]
	_update_skin_variations_list()
	selected_variation = skin_variations[actual_variation_index]
	_update_texture()
	selected_animation = animations[actual_animation_index]
	_update_screen()
	

func _update_skin_variations_list() -> void:
	skin_variations = Constants.SKINS_MAP.get(selected_skin_class)

func _update_texture() -> void:
	selected_texture = PATH_TO_SKINS + selected_skin_class + "/" + selected_variation + TEXTURE_EXTENSION

func _update_screen() -> void:
	skin_class_label.text = selected_skin_class.capitalize()
	variation_skin_label.text = selected_variation.capitalize()
	animation_label.text = selected_animation.capitalize()
	character_reference.get_node("humanoid").set_skin(selected_texture)
	PlayerData.current_skin = selected_texture
	character_reference.set_default_animation(selected_animation)

func _set_new_index(actual_value: int, max_value: int, increse_value: bool = true) -> int:
	var new_value = 0
	
	if increse_value:
		new_value = actual_value + 1
	else:
		new_value = actual_value - 1
	
	if new_value > max_value:
		return 0
	
	if new_value < 0:
		return max_value
	
	return new_value


func _on_skin_class_right_button_up():
	var max_value = skin_classes.size() - 1
	actual_skin_class_index = _set_new_index(actual_skin_class_index, max_value)
	actual_variation_index = 0
		
	_update_values()


func _on_skin_class_left_button_up():
	var max_value = skin_classes.size() - 1
	actual_skin_class_index = _set_new_index(actual_skin_class_index, max_value, false)
	actual_variation_index = 0
	
	_update_values()


func _on_variation_right_button_up():
	var max_value = skin_variations.size() - 1
	actual_variation_index = _set_new_index(actual_variation_index, max_value)
	_update_values()


func _on_variation_left_button_up():
	var max_value = skin_variations.size() - 1
	actual_variation_index = _set_new_index(actual_variation_index, max_value, false)
	_update_values()


func _on_animation_right_button_up():
	var max_value = animations.size() - 1
	actual_animation_index = _set_new_index(actual_animation_index, max_value)
	_update_values()


func _on_animation_left_button_up():
	var max_value = animations.size() - 1
	actual_animation_index = _set_new_index(actual_animation_index, max_value, false)
	_update_values()

