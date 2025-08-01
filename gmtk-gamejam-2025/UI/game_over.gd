extends CanvasLayer



func _on_restart_button_button_down() -> void:
	get_tree().reload_current_scene()
	Global.load_scene.call_deferred()
	queue_free.call_deferred()
