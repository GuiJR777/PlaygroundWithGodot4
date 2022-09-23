extends Control


@onready var animation: AnimationPlayer = $animation_player

var can_acess: bool = false


func _ready():
	animation.play("start")


func _on_animation_player_animation_finished(_anim_name):
	can_acess = true


func _on_projects_button_button_up():
	if can_acess:
		print("Vai pra tela de projetos")


func _on_minigames_button_button_up():
	if can_acess:
		print("Vai pra tela de mini-games")
