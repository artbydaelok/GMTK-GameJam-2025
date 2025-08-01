extends Node2D

@export var damage : int = 1

func _on_damage_area_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.on_player_damaged(damage)
