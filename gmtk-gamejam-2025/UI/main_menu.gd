extends Control


var level_selection = preload("res://UI/level_selection.tscn")
var audio = preload("res://UI/audio_settings.tscn")
var how_to_play = preload("res://UI/how_to_play.tscn")

const DEAD_REVOLVER_DISPLAY = preload("res://assets/Fonts/Dead Revolver Typeface/Dead Revolver Typeface/Fonts/Display/OTF/DeadRevolverDisplay.otf")
const DEAD_REVOLVER_DISPLAY_OUTLINED = preload("res://assets/Fonts/Dead Revolver Typeface/Dead Revolver Typeface/Fonts/Display/OTF/DeadRevolverDisplayOutlined.otf")
const DEAD_REVOLVER_ARCADE = preload("res://assets/Fonts/Dead Revolver Typeface/Dead Revolver Typeface/Fonts/Arcade/OTF/DeadRevolverArcade.otf")
const DEAD_REVOLVER_ARCADE_OUTLINED = preload("res://assets/Fonts/Dead Revolver Typeface/Dead Revolver Typeface/Fonts/Arcade/OTF/DeadRevolverArcadeOutlined.otf")
const DEAD_REVOLVER_GAME = preload("res://assets/Fonts/Dead Revolver Typeface/Dead Revolver Typeface/Fonts/Game/OTF/DeadRevolverGame.otf")

@onready var game_title_drop: Label = %GameTitleDrop
@onready var game_title_loop: Label = %GameTitleLoop

var fonts : Array[Font]
@onready var font_timer: Timer = $FontTimer
var current_font : Font 

func _ready() -> void:
	fonts = [
			DEAD_REVOLVER_ARCADE, 
			DEAD_REVOLVER_ARCADE_OUTLINED,
			DEAD_REVOLVER_GAME,
			DEAD_REVOLVER_DISPLAY, 
			DEAD_REVOLVER_DISPLAY_OUTLINED
			]
	focus()
	
func change_font():
	var remaining_fonts = fonts.duplicate()
	
	if current_font != null:
		remaining_fonts.erase(current_font)
		
	var new_font = remaining_fonts.pick_random()
	current_font = new_font
	
	game_title_drop.add_theme_font_override("font", new_font)
	
	await get_tree().create_timer(font_timer.wait_time * 0.5).timeout
	
	game_title_loop.add_theme_font_override("font", new_font)
	#game_title_drop.add_theme_font_override("font", fonts.pick_random())
	#game_title_loop.add_theme_font_override("font", fonts.pick_random())
	
func focus() -> void:
	$Panel/MarginContainer/VBoxContainer2/PlayButton.grab_focus()

func _on_play_button_pressed() -> void:
	var instance = level_selection.instantiate()
	add_child(instance)
	instance.focus()


func _on_audio_button_pressed() -> void:
	$Panel/MarginContainer/VBoxContainer2/AudioButton.release_focus()
	var instance = audio.instantiate()
	add_child(instance)
	instance.focus()


func _on_how_to_play_button_pressed() -> void:
	$Panel/MarginContainer/VBoxContainer2/HowToPlayButton.release_focus()
	var instance = how_to_play.instantiate()
	add_child(instance)
	instance.focus()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_sluggerpunk_studios_button_pressed() -> void:
	OS.shell_open("www.sluggerpunkstudios.com")


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/HHvPB36fEd")


func _on_font_timer_timeout() -> void:
	change_font()
