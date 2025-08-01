extends Node2D

@onready var area_2d: Area2D = $Area2D

@export var points : float 

func _on_area_2d_body_entered(body: Node2D) -> void:
	on_collision(body)

func on_collision(body: Node2D):
	if body is Player:
		print("Player Interacted")
		Global.update_score(points)
		get_tree().get_first_node_in_group("Level").play_collectible_sfx()
		queue_free()
