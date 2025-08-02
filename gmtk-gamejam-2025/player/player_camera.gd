extends Camera2D
class_name PlayerCamera

@export var max_shake: float = 10.0
@export var shake_fade: float = 10.0
var shake_strength : float = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
func trigger_camera_shake():
	shake_strength = max_shake
	
