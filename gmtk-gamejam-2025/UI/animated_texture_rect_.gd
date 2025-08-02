class_name AnimatedTextureRect extends TextureRect

@export var sprites : SpriteFrames
@export var current_anim = "default"
@export var frame_index = 0
@export_range(0.0, INF, 0.001) var speed_scale = 1.0
@export var auto_play = false
@export var playing = false

var refresh_rate = 1.0
var fps = 30.0
var frame_delta = 0

func _ready() -> void:
	fps = sprites.get_animation_speed(current_anim)
	refresh_rate = sprites.get_frame_duration(current_anim, frame_index)
	if auto_play: play()
	
func play(animation_name: String = current_anim) -> void:
	frame_index = 0
	frame_delta = 0.0
	current_anim = animation_name
	get_animation_data(current_anim)
	playing = true
	
func get_animation_data(animation) -> void:
	fps = sprites.get_animation_speed(current_anim)
	refresh_rate = sprites.get_frame_duration(current_anim, frame_index)
	
func resume() -> void:
	playing = true
	
func pasue() -> void:
	playing = false
	
func stop() -> void:
	frame_index = 0
	playing = false
	
func _process(delta: float) -> void:
	if sprites == null or not playing: return
	
	if sprites.has_animation(current_anim) == false:
		playing = false
		assert(false, "Animation %s, Dones't Exist" % current_anim)
		
	get_animation_data(current_anim)
	
	frame_delta += (speed_scale * delta)
	
	if frame_delta >= refresh_rate/fps:
		texture = get_next_frame()
		frame_delta = 0.0
		
func get_next_frame():
	frame_index += 1
	var frame_count = sprites.get_frame_count(current_anim)
	
	if frame_index >= frame_count:
		frame_index = 0
		if not sprites.get_animation_loop(current_anim): playing = false
	
	get_animation_data(current_anim)
	
	return sprites.get_frame_texture(current_anim, frame_index)
