extends Sprite2D


@onready var current_scene = $"../../.."

func _ready():
	pass

func _process(delta):
	self.material.set("shader_param/iTime", current_scene.iTime)
	self.material.set("shader_param/iFrame", current_scene.iFrame)

func cov_scb(value):
	self.material.set("shader_param/COVERAGE",float(value)/100)

func absb_scb(value):
	self.material.set("shader_param/ABSORPTION",float(value)/10)

func thick_scb(value):
	self.material.set("shader_param/THICKNESS",value)

func step_scb(value):
	self.material.set("shader_param/STEPS",value)
