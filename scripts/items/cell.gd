extends TextureButton
class_name Cell

var board_position: Vector2

signal cell_selected(position)

var color_map: Dictionary = {
	"cross": Color(1, 0, 0),
	"circle": Color(0, 0, 1),
	"default": Color(1, 1, 1)
}

func clear_cell() -> void:
	self.modulate = color_map.get("default")
	self.disabled = false


func _on_select_cell() -> void:
	self.modulate = color_map.get(TicTacToeGlobal.CURRENT_PLAYER)
	cell_selected.emit(self.board_position)
	self.disabled = true
