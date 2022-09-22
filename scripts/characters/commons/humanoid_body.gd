extends Node3D

class_name HumanoidBody


func set_skin(texture_path: String) -> void:
	var texture = load(texture_path)
	$Armature/GeneralSkeleton/mesh.get_active_material(0).albedo_texture = texture
