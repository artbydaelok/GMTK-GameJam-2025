extends RigidBody2D

@onready var destroy_timer: Timer = $DestroyTimer

@export var damage_Amount : int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	destroy_timer.timeout.connect(on_destroy)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.on_damaged.emit(damage_Amount)
		print("HIT " + body.name)
		queue_free()

func on_destroy():
	queue_free()
