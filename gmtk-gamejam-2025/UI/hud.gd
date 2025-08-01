extends CanvasLayer

@onready var current_score_label: Label = %CurrentScoreLabel

func _ready() -> void:
	current_score_label.text = "Score: " + str(0) + " pts"
	Global.on_score_update.connect(update_score)

func update_score(current_score):
	current_score_label.text = "Score: " + str(current_score) + " pts"
