extends VBoxContainer
class_name ProjectCard

@onready var title_label: Label = $title
@onready var description_label: Label = $description
@onready var image_container: TextureButton = $image

var title: String = ""
var description: String = ""
var image: String = ""
var scene_destiny: String = ""


func update_card() -> void:
	title_label.text = title
	description_label.text = description
	image_container.texture_normal = load(image)


func _on_image_mouse_entered():
	image_container.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_COVERED


func _on_image_mouse_exited():
	image_container.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED


func _on_image_button_up():
	var selected_scene = get_tree().get_current_scene().get_scene_file_path()
	Global.actual_page_index += 1
	Global.previous_scenes.append(selected_scene)
	get_tree().change_scene_to_file(scene_destiny)
