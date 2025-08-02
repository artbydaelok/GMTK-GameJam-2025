extends RigidBody2D

var player : Player 

@onready var grenade_collision_shape: CollisionShape2D = $GrenadeCollisionShape

@onready var player_shape_cast: ShapeCast2D = $PlayerShapeCast

var attempt_collision := false

func _ready() -> void:
	await get_tree().create_timer(0.125).timeout
	
	attempt_collision = true


func _process(delta: float) -> void:
	if attempt_collision:
		if player_shape_cast.get_collision_count() == 0:
			grenade_collision_shape.disabled = false

func _on_body_entered(body: Node) -> void:
	player = get_tree().get_first_node_in_group("Player")
	if not body.is_in_group("Player"):
		player.global_position = global_position
		queue_free()


func _on_self_destroy_timeout() -> void:
	queue_free()
