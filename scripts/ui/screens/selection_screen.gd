extends Control

@onready var card: ProjectCard = $MarginContainer/content/card

@export var cards: Array[Dictionary] = [
	{
		"title": "Titulo",
		"description": "Uma descrição do item",
		"image": "res://assets/UI/backgrounds/logo.png",
		"scene_destiny": "",
	},
	{
		"title": "Novo Titulo",
		"description": "Outra descrição do item",
		"image":"res://assets/UI/backgrounds/logo_black_bg.png" ,
		"scene_destiny": "",
	},
]

var selected_card_index: int = 0


func _ready():
	_change_card()

func _change_card() -> void:
	var card_data: Dictionary = cards[selected_card_index]
	card.title = card_data.get("title")
	card.description = card_data.get("description")
	card.image = card_data.get("image")
	card.scene_destiny = card_data.get("scene_destiny")
	card.update_card()


func _on_previous_button_up():
	var max_cards_index = cards.size() - 1
	selected_card_index -= 1
	
	if selected_card_index < 0:
		selected_card_index = max_cards_index
	
	_change_card()


func _on_next_button_up():
	var max_cards_index = cards.size() - 1
	selected_card_index += 1
	
	if selected_card_index > max_cards_index:
		selected_card_index = 0
	
	_change_card()
