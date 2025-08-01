extends Node
@export var player : Player 
@export var timer : Timer

@export var possible_level_hazards : Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn_hazard)

func reset_timer():
	timer.stop()
	timer.start()

func spawn_hazard():
	var pos = player.global_position + Vector2(0, -16)

	var hazard_scene = possible_level_hazards.pick_random()
	var hazard = hazard_scene.instantiate()
	
	var level = get_tree().get_first_node_in_group("Level")
	level.add_child(hazard)
	
	hazard.global_position = pos
