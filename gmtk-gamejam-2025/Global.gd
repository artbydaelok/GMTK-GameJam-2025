extends Node

var unlocked_double_jump := false
var current_score : float
var HP : int

signal on_score_update(current_score : float)
signal on_damaged(amount)

func update_score(amount : float):
	current_score += amount
	on_score_update.emit(current_score)
	print("The current score is : " + str(current_score))
