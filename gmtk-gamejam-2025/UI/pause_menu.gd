extends CanvasLayer

@export var main_menu = preload("res://UI/main_menu.tscn")

@onready var audio_streamer = $AudioStreamPlayer2D

var audio = preload("res://UI/audio_settings.tscn")
var how_to_play = preload("res://UI/how_to_play.tscn")
var button_click_sfx = preload("res://assets/sounds/Click sound 1.wav")
var button_hover_sfx = preload("res://assets/sounds/Hover over button sound 1.wav")

func _ready() -> void:
	get_tree().paused = true
	focus()
	
func focus() -> void:
	await get_tree().create_timer(.5).timeout
	$Panel/MarginContainer/VBoxContainer2/ResumeButton.grab_focus()

func _on_resume_button_pressed() -> void:
	play_button_click_sfx()
	get_tree().paused = false
	queue_free()

func _on_audio_button_pressed() -> void:
	play_button_click_sfx()
	$Panel/MarginContainer/VBoxContainer2/AudioButton.release_focus()
	var instance = audio.instantiate()
	add_child(instance)
	instance.focus()

func _on_how_to_play_button_pressed() -> void:
	play_button_click_sfx()
	$Panel/MarginContainer/VBoxContainer2/HowToPlayButton.release_focus()
	var instance = how_to_play.instantiate()
	add_child(instance)
	instance.focus()

func _on_main_menu_button_pressed() -> void:
	play_button_click_sfx()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_on_resume_button_pressed()
		
func play_button_click_sfx() -> void:
	audio_streamer.stream = button_click_sfx
	audio_streamer.play()

func _on_entered() -> void:
	audio_streamer.stream = button_hover_sfx
	audio_streamer.play()
