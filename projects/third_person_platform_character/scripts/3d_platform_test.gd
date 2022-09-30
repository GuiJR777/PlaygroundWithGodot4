extends Node3D

@onready var iTime: float = 0.0
@onready var iFrame: int = 0

func _ready():
	pass

func _process(delta):
	iTime+=delta
	iFrame+=1
