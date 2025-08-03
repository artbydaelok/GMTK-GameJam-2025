extends Node2D

@export var start_point: Node2D 
@export var level_end : Area2D

@onready var hazard_spawner: Node = $HazardSpawner
@onready var hazard_spawn_timer: Timer = $HazardSpawnTimer

var pause_menu = preload("res://UI/pause_menu.tscn")

signal on_level_loop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_end.body_entered.connect(on_level_end_triggered)

func on_level_end_triggered(body):
	if body is Player:
		Global.update_score(15)
		loop(body)
	
func play_collectible_sfx():
	$CollectibleSFX.play()
	
func loop(body):
	body.global_position = start_point.global_position
	$LoopSFX.play()
	on_level_loop.emit()
	###
	### Spawn new set of collectibles
	###
	
func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("pause"):
		#var instance = pause_menu.instantiate()
		#add_child(instance)
	#el
	if event.is_action_pressed("restart"):
		loop(Global.player)
	
