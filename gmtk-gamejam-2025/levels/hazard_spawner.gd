extends Node
@export var player : Player 
@export var timer : Timer

var hud : HUD

const HAZARD_ALERT = preload("res://hazards/hazard_alert.tscn")
@export var possible_level_hazards : Array[PackedScene]

var hazard_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(.1).timeout
	hud = get_tree().get_first_node_in_group("HUD")
	hazard_scene = possible_level_hazards.pick_random()
	hud.set_hazard_anim(hazard_scene.get_path())
	timer.timeout.connect(spawn_hazard)

func reset_timer():
	timer.stop()
	timer.start()
	hazard_scene = possible_level_hazards.pick_random()

func spawn_hazard():
	var pos = player.global_position + Vector2(0, -16)
	var hazard = hazard_scene.instantiate()
	var level = get_tree().get_first_node_in_group("Level")
	var alert = HAZARD_ALERT.instantiate()
	
	level.add_child(alert)
	alert.global_position = pos
	
	hud.is_running = false
	timer.stop()
	var spawn_delay : float = 1.5
	await get_tree().create_timer(spawn_delay).timeout
	
	level.add_child(hazard)
	
	hazard.global_position = alert.global_position
	alert.queue_free()
	hazard_scene = possible_level_hazards.pick_random()
	hud.set_hazard_anim(hazard_scene.get_path())
