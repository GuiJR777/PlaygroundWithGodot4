extends Node3D

class_name HumanoidBody

@export var body: MeshInstance3D = null


func set_skin(texture_path: String) -> void:
	var texture = load(texture_path)
	body.get_active_material(0).albedo_texture = texture
