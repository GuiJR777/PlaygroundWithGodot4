extends Node3D
class_name HumanoidCharacter


@onready var mesh: MeshInstance3D = get_node("skelleton/mesh")
@export var selected_skin_class: String = "survivor"
@export var skin_variation: int = 0

func _ready():
	change_skin(selected_skin_class, skin_variation)

func change_skin(skin_class: String, variation: int) -> void:
	var texture_path: String = Constants.SKINS_MAP.get(skin_class, [])[variation]
	var texture = load(texture_path)
	mesh.get_active_material(0).albedo_texture = texture
	skin_variation = variation
