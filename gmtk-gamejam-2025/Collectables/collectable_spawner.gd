extends Node

const COLLECTABLE_BASE = preload("res://Collectables/collectable_base.tscn")

@export_subgroup("Defaults")

@export var spawn_amount : int

@export_subgroup("Random Spawning")

@export var use_random_spawn_amount : bool
@export var max_spawn_amount : int
@export var min_spawn_amount : int

var spawn_location : Array[Vector2]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().on_level_loop.connect(on_level_loop)
	
	var spawn_points = get_tree().get_nodes_in_group("SpawnLocation")
	
	for spawner in spawn_points:
		spawn_location.append(spawner.global_position)

func on_level_loop():
	var count := randi_range(min_spawn_amount, max_spawn_amount) if use_random_spawn_amount else spawn_amount
	
	for i in count: 
		spawn_collectables()

func spawn_collectables():
		var collectable = COLLECTABLE_BASE.instantiate()
		collectable.global_position = spawn_location[randi_range(0, spawn_location.size() - 1)]
		print("Random Transfrom: ", spawn_location)
		get_parent().call_deferred("add_child", collectable)
