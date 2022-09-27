class_name StateManager
extends Node

var _current_state: State = null

func _ready():
	_current_state = get_child(0)
	await  get_parent().ready
	_current_state.on_state_enter()


func change_state(state: String):
	if _current_state:
		_current_state.on_state_exit()
	_current_state = get_node(state)
	_current_state.on_state_enter()


func _physics_process(_delta):
	_current_state.on_state_update()
