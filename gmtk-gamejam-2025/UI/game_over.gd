extends CanvasLayer

@onready var player_score_text: Label = $Panel/VBoxContainer/ScoreContainer/PlayerScoreText

@onready var audio_streamer = $AudioStreamPlayer2D

var button_click_sfx = preload("res://assets/sounds/Click sound 1.wav")
var button_hover_sfx = preload("res://assets/sounds/Hover over button sound 1.wav")


func _ready() -> void:
	get_tree().paused = true
	player_score_text.text = str(Global.current_score)
	focus()
	
func focus() -> void:
	await get_tree().create_timer(.5).timeout
	$Panel/VBoxContainer/NavigationContainer/RestartButton.grab_focus()

func _on_restart_button_pressed() -> void:
	play_button_click_sfx()
	get_tree().paused = false
	get_tree().reload_current_scene()
	Global.load_scene.call_deferred()
	queue_free.call_deferred()
	
func _on_main_menu_button_pressed() -> void:
	play_button_click_sfx()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	
func play_button_click_sfx() -> void:
	audio_streamer.stream = button_click_sfx
	audio_streamer.play()

func _on_entered() -> void:
	audio_streamer.stream = button_hover_sfx
	audio_streamer.play()
