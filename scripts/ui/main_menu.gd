extends Control


@onready var animation: AnimationPlayer = $animation_player

var can_acess: bool = false


func _ready():
	animation.play("start")


func _on_animation_player_animation_finished(_anim_name):
	can_acess = true

