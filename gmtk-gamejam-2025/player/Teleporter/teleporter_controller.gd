extends Node

const TELEPORTER_GRENADE = preload("res://player/Teleporter/teleporter_grenade.tscn")

var cooldown_time : float = 1.5

var player : Player
var level : Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	level = get_tree().get_first_node_in_group("Level")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("teleport"):
		print("Teleporting")
		var teleporter_grenade = TELEPORTER_GRENADE.instantiate()
		teleporter_grenade.global_position = player.global_position + Vector2(0, -16)
		
		var dir
		
		level.add_child(teleporter_grenade)
		
		if player.facing_right:
			dir = 1
		else:
			dir = -1
			
		teleporter_grenade.linear_velocity = Vector2(dir * 400, -250)
	
