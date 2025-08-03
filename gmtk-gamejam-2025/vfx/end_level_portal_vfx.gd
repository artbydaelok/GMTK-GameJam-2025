extends CPUParticles2D

@onready var level_end_line: Line2D = $LevelEndLine

func _ready() -> void:
	var start_point = Vector2(-emission_rect_extents.x , 0.0)
	var end_point = Vector2(emission_rect_extents.x , 0.0)
	level_end_line.add_point(start_point)
	level_end_line.add_point(end_point)
	
