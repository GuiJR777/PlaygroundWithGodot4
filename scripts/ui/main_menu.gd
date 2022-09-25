extends Control


@onready var animation: AnimationPlayer = $animation_player
@onready var bg_music:AudioStreamPlayer = $back_music

var can_play_music: bool = false


func _ready():
	animation.play("start")

func _process(_delta):
	if can_play_music and not bg_music.playing:
		bg_music.play()


func _on_animation_player_animation_finished(_anim_name):
	can_play_music = true

