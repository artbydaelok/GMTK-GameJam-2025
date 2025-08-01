extends Node2D

@onready var area_2d: Area2D = $Area2D

@export var points : float 

func _on_area_2d_body_entered(body: Node2D) -> void:
	on_collision(body)

func on_collision(body: Node2D):
	if body is Player:
		print("Player Interacted")
		Global.update_score(points)
		queue_free()
