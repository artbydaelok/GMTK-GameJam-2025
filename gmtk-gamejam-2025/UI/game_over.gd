extends CanvasLayer

@onready var player_score_text: Label = $ScoreContainer/PlayerScoreText


func _ready() -> void:
	player_score_text.text = str(Global.current_score)

func _on_restart_button_button_down() -> void:
	get_tree().reload_current_scene()
	Global.load_scene.call_deferred()
	queue_free.call_deferred()
