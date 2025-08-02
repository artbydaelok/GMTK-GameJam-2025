extends Node2D

@export var start_point: Node2D 
@export var level_end : Area2D

@onready var hazard_spawner: Node = $HazardSpawner
@onready var hazard_spawn_timer: Timer = $HazardSpawnTimer

signal on_level_loop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_end.body_entered.connect(on_level_end_triggered)

func on_level_end_triggered(body):
	if body is Player:
		body.global_position = start_point.global_position
		Global.update_score(15)
		$LoopSFX.play()
		on_level_loop.emit()
	###
	### Spawn new set of collectibles
	###
	
func play_collectible_sfx():
	$CollectibleSFX.play()
