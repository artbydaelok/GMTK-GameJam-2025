extends Node

const GAME_OVER = preload("res://UI/game_over.tscn")

var unlocked_double_jump := false
var current_score : float
var HP : int = 3 
var max_HP : int = 3
var player : Player

signal on_score_update(current_score : float)
signal on_damaged(amount)

func _ready() -> void:
	HP = max_HP
	player = get_tree().get_first_node_in_group("Player") as Player
	on_damaged.connect(on_player_damaged)

func update_score(amount : float):
	current_score += amount
	on_score_update.emit(current_score)
	print("The current score is : " + str(current_score))

func on_player_damaged(amount):
	
	HP = clamp(HP - amount, 0, max_HP)
	
	if HP <= 0:
		player.visible = false
		player.set_physics_process(false)
		var game_over_ui = GAME_OVER.instantiate()
		add_child(game_over_ui)
