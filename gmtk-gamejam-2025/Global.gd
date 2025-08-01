extends Node

const GAME_OVER = preload("res://UI/game_over.tscn")

var unlocked_double_jump := false
var current_score : int
var HP : int = 3 
var max_HP : int = 3
var player : Player

signal on_score_update(current_score : float)
signal on_damaged(amount)

func _ready() -> void:
	load_scene()
	on_damaged.connect(on_player_damaged)

func load_scene():
	current_score = 0
	HP = max_HP

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
		var hud = get_tree().get_first_node_in_group("HUD")
		hud.add_child(game_over_ui)
