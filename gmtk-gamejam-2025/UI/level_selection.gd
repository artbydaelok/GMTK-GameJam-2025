extends Control

@onready var audio_streamer = $AudioStreamPlayer2D

var level_one = preload("res://levels/metrics_level.tscn")
var level_two = preload("res://levels/lvl_footrace.tscn")
var level_three = preload("res://levels/lvl_uturn.tscn")
var level_four = preload("res://levels/lvl_winding_path.tscn")
var level_five = preload("res://levels/lvl_drop.tscn")

var button_click_sfx = preload("res://assets/sounds/Click sound 1.wav")
var button_hover_sfx = preload("res://assets/sounds/Hover over button sound 1.wav")

func _ready() -> void:
	focus()
	
func focus() -> void:
	await get_tree().create_timer(.5).timeout
	$Panel/MarginContainer/VBoxContainer/VBoxContainer2/LevelOne.grab_focus()

func _on_level_one_pressed() -> void:
	play_button_click_sfx()
	get_tree().change_scene_to_packed(level_one)
	queue_free()

func _on_level_two_pressed() -> void:
	play_button_click_sfx()
	get_tree().change_scene_to_packed(level_two)
	queue_free()

func _on_level_three_pressed() -> void:
	play_button_click_sfx()
	get_tree().change_scene_to_packed(level_three)
	queue_free()

func _on_level_four_pressed() -> void:
	play_button_click_sfx()
	get_tree().change_scene_to_packed(level_four)
	queue_free()

func _on_level_five_pressed() -> void:
	play_button_click_sfx()
	get_tree().change_scene_to_packed(level_five)
	queue_free()

func _on_back_button_pressed() -> void:
	play_button_click_sfx()
	get_parent().focus()
	queue_free()
	
func play_button_click_sfx() -> void:
	audio_streamer.stream = button_click_sfx
	audio_streamer.play()

func _on_entered() -> void:
	audio_streamer.stream = button_hover_sfx
	audio_streamer.play()
