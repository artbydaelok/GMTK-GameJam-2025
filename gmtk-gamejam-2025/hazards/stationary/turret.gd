extends Node2D


const PROJECTILE = preload("res://hazards/projectile.tscn")
@onready var projectile_spawn_point: Marker2D = %ProjectileSpawnPoint
@onready var shooting_animation: AnimationPlayer = $ShootingAnimation
@onready var shoot_sfx: AudioStreamPlayer2D = $ShootSFX

@export var camera_shake_falloff : float = 350
@export var max_shake: float = 10.0
@export var shake_fade: float = 10.0

var level : Node2D
var player_camera : PlayerCamera
var player 
func _ready() -> void:
	level = get_tree().get_first_node_in_group("Level")
	player = get_tree().get_first_node_in_group("Player") as Player
	
	player_camera = get_tree().get_first_node_in_group("Camera")
	player_camera.max_shake = max_shake
	player_camera.shake_fade = shake_fade

func shoot():
	var p = PROJECTILE.instantiate()
	level.add_child(p)
	p.global_position = projectile_spawn_point.global_position
	p.linear_velocity = global_position.direction_to(projectile_spawn_point.global_position) * 125.0
	shoot_sfx.play()
	
	print(global_position.distance_to(player.global_position))
	
	if global_position.distance_to(player.global_position) <= camera_shake_falloff:
		player_camera.trigger_camera_shake()
	
func _on_shoot_timer_timeout() -> void:
	shooting_animation.play("shoot")
