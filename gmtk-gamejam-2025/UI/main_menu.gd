extends Control

var level_one = preload("res://main.tscn")
var audio = preload("res://UI/audio_settings.tscn")

func _on_play_button_pressed() -> void:
	#TODO: check for save file on database and load data.
	get_tree().change_scene_to_packed(level_one)


func _on_audio_button_pressed() -> void:
	var instance = audio.instantiate()
	add_child(instance)


func _on_hot_to_play_button_pressed() -> void:
	#TODO: change to the how to play scene
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_sluggerpunk_studios_button_pressed() -> void:
	OS.shell_open("www.sluggerpunkstudios.com")


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/HHvPB36fEd")
