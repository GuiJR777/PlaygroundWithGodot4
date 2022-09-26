class_name State
extends Node

var state_manager: StateManager = null
var parent: ThirdPersonCharacter = null


func _ready():
	state_manager = get_parent()
	parent = state_manager.get_parent()

func on_state_enter():
	print("Enter State: ", self.name)
	parent.animation_playback.travel(self.name)


func on_state_update():
	pass


func on_state_exit():
	print("Exiting state: ", self.name)

