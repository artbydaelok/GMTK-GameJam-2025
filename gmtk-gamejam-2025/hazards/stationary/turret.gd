extends Node2D


const PROJECTILE = preload("res://hazards/projectile.tscn")
@onready var projectile_spawn_point: Marker2D = $ProjectileSpawnPoint
@onready var shooting_animation: AnimationPlayer = $ShootingAnimation


var level : Node2D

func _ready() -> void:
	level = get_tree().get_first_node_in_group("Level")

func shoot():
	var p = PROJECTILE.instantiate()
	level.add_child(p)
	p.global_position = projectile_spawn_point.global_position
	p.linear_velocity = global_position.direction_to(projectile_spawn_point.global_position) * 125.0

func _on_shoot_timer_timeout() -> void:
	shooting_animation.play("shoot")
