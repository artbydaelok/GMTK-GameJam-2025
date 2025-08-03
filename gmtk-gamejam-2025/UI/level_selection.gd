extends Control

var level_one = preload("res://main.tscn")
var level_two = preload("res://levels/lvl_footrace.tscn")
var level_three = preload("res://levels/lvl_uturn.tscn")
var level_four = preload("res://levels/lvl_winding_path.tscn")
var level_five = preload("res://levels/metrics_level.tscn")

func _ready() -> void:
	focus()
	
func focus() -> void:
	$Panel/MarginContainer/VBoxContainer/VBoxContainer2/LevelOne.grab_focus()

func _on_level_one_pressed() -> void:
	get_tree().change_scene_to_packed(level_one)

func _on_level_two_pressed() -> void:
	get_tree().change_scene_to_packed(level_two)

func _on_level_three_pressed() -> void:
	get_tree().change_scene_to_packed(level_three)

func _on_level_four_pressed() -> void:
	get_tree().change_scene_to_packed(level_four)

func _on_level_five_pressed() -> void:
	get_tree().change_scene_to_packed(level_five)

func _on_back_button_pressed() -> void:
	get_parent().focus()
	queue_free()
