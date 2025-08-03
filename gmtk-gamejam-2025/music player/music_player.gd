extends AudioStreamPlayer

var current_track_index := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level = get_tree().get_first_node_in_group("Level")
	level.on_level_loop.connect(progress_next)
	await get_tree().create_timer(.1).timeout
	$".".play()


func progress_next():
	if current_track_index == 3:
		return
	
	current_track_index += 1
	
	var s : AudioStreamSynchronized = stream
	s.set_sync_stream_volume(current_track_index, 0)
	
