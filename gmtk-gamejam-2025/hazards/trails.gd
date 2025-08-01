extends Line2D

@export var length : float = 50

var point

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = Vector2.ZERO
	global_rotation = 0
	point = get_parent().position
	add_point(point)
	
	while get_point_count() > length:
		remove_point(0)

func reset():
	clear_points()
