extends Control

var master_audio_bus = AudioServer.get_bus_index("Master")
var music_audio_bus = AudioServer.get_bus_index("Music")
var sfx_audio_bus = AudioServer.get_bus_index("SFX")

@onready var master_slider = $Panel/MarginContainer/VBoxContainer2/Master/MasterSlider
@onready var music_slider = $Panel/MarginContainer/VBoxContainer2/Music/MusicSlider
@onready var sfx_slider = $Panel/MarginContainer/VBoxContainer2/SFX/SFXSlider

func _ready() -> void:
	print_debug(db_to_linear(AudioServer.get_bus_volume_db(master_audio_bus)))
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_audio_bus))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_audio_bus))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_audio_bus))

func focus() -> void:
	$Panel/MarginContainer/VBoxContainer2/Master/MasterSlider.grab_focus()
	
func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_audio_bus, linear_to_db(value))

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_audio_bus, linear_to_db(value))

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_audio_bus, linear_to_db(value))

func _on_button_back_pressed() -> void:
	get_parent().focus()
	queue_free()

func _on_master_slider_drag_started() -> void:
	$MasterAudioStreamPlayer2D.play()

func _on_master_slider_drag_ended(value_changed: bool) -> void:
	$MasterAudioStreamPlayer2D.stop()

func _on_music_slider_drag_started() -> void:
	$MusicAudioStreamPlayer2D2.play()

func _on_music_slider_drag_ended(value_changed: bool) -> void:
	$MusicAudioStreamPlayer2D2.stop()

func _on_sfx_slider_drag_started() -> void:
	$SFXAudioStreamPlayer2D3.play()

func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	$SFXAudioStreamPlayer2D3.stop()
