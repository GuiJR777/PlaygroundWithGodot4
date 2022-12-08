extends GridContainer
class_name Board

var board: Array[Array]

func _ready() -> void:
	$Cell.board_position = Vector2(0, 0)
	$Cell2.board_position = Vector2(0, 1)
	$Cell3.board_position = Vector2(0, 2)
	$Cell4.board_position = Vector2(1, 0)
	$Cell5.board_position = Vector2(1, 1)
	$Cell6.board_position = Vector2(1, 2)
	$Cell7.board_position = Vector2(2, 0)
	$Cell8.board_position = Vector2(2, 1)
	$Cell9.board_position = Vector2(2, 2)
	
	
func __create_board() -> void:
	board = []
	for line in range(3):
		var lines = []
		for column in range(3):
			lines.append("")
		board.append(lines)


func __has_a_winner_in_line() -> bool:
	for line in range(3):
		var cel_1 = board[line][0]
		var cel_2 = board[line][1]
		var cel_3 = board[line][2]
		
		if cel_1 == cel_2 and cel_2 == cel_3 and cel_3 != "":
			return true
	return false


func __has_a_winner_in_column() -> bool:
	for column in range(3):
		var cel_1 = board[0][column]
		var cel_2 = board[1][column]
		var cel_3 = board[2][column]
		
		if cel_1 == cel_2 and cel_2 == cel_3 and cel_3 != "":
			return true
	return false

func __has_winner_in_diagon() -> bool:
	var cel_1 = board[0][0]
	var cel_2 = board[1][1]
	var cel_3 = board[2][2]
	
	if cel_1 == cel_2 and cel_2 == cel_3 and cel_3 != "":
			return true
	
	cel_1 = board[0][2]
	cel_3 = board[2][0]
	
	if cel_1 == cel_2 and cel_2 == cel_3 and cel_3 != "":
			return true
	
	return false

func check_for_winners() -> bool:
	print(board)
	if __has_a_winner_in_line():
		return true
	
	if __has_a_winner_in_column():
		return true
	
	if __has_winner_in_diagon():
		return true
	
	return false

func clear() -> void:
	for cell in get_tree().get_nodes_in_group("cell"):
		cell.clear_cell()
	__create_board()

func is_filled() -> bool:
	for line in board:
		for column in line:
			if column == "":
				return false
	return true
