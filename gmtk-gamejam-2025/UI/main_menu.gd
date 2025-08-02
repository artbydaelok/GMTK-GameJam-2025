extends Control

@export var level_one : PackedScene = preload("res://main.tscn")

func _on_play_button_pressed() -> void:
	#TODO: check for save file on database and load data.
	get_tree().change_scene_to_packed(level_one)


func _on_settings_button_pressed() -> void:
	#TODO: change to the settings scene
	pass # Replace with function body.


func _on_hot_to_play_button_pressed() -> void:
	#TODO: change to the how to play scene
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_sluggerpunk_studios_button_pressed() -> void:
	OS.shell_open("www.sluggerpunkstudios.com")


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/HHvPB36fEd")
