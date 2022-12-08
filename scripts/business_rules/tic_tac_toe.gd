extends Node2D
class_name TicTacToeBoard

@onready var board: Board = %Tabuleiro

func _ready() -> void:
	board.clear()


func __finish_turn() -> void:
	var has_winner = board.check_for_winners()
	if has_winner:
		var player_winner = __get_name_of_winner()
		print(player_winner, "Ganhou!!!")
		board.clear()
	
	elif board.is_filled():
		print("Empate.")
		board.clear()
	
	__change_current_player()
	
	
		
func __get_name_of_winner() -> String:
	if TicTacToeGlobal.CURRENT_PLAYER == "cross":
		return TicTacToeGlobal.PLAYER_ONE_NAME
	return TicTacToeGlobal.PLAYER_TWO_NAME


func __change_current_player() -> void:
	if TicTacToeGlobal.CURRENT_PLAYER == "cross":
		TicTacToeGlobal.CURRENT_PLAYER = "circle"
	else:
		TicTacToeGlobal.CURRENT_PLAYER = "cross"


func _on_cell_selected(position: Vector2) -> void:
	print(position)
	var line = position.x
	var column = position.y
	
	board.board[line][column] = TicTacToeGlobal.CURRENT_PLAYER
	__finish_turn()

