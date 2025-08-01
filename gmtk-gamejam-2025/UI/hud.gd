extends CanvasLayer

@onready var current_score_label: Label = %CurrentScoreLabel
@onready var health_container: HBoxContainer = %HealthContainer
@onready var hazard_progress_bar: ProgressBar = %HazardProgress

const HEART_DETAILED_EMPTY = preload("res://assets/Pixel UI & HUD/Pixel UI & HUD/Sprites/Hearts/Blue/HeartDetailed_Empty.png")
const HEART_DETAILED_FULL = preload("res://assets/Pixel UI & HUD/Pixel UI & HUD/Sprites/Hearts/Blue/HeartDetailed_Full.png")

var level : Node2D

func _ready() -> void:
	current_score_label.text = "Score\n" + str(0) + " pts"
	setup_health()
	Global.on_score_update.connect(update_score)
	Global.on_damaged.connect(update_health)
	
	level = get_tree().get_first_node_in_group("Level")

func _process(delta: float) -> void:
	var hazard_progress_value = level.hazard_spawn_timer.time_left / level.hazard_spawn_timer.wait_time
	hazard_progress_bar.value = (1 - hazard_progress_value) * 100.0

func setup_health():
	for i in range(Global.max_HP):
		var s = TextureRect.new()
		health_container.add_child(s)
		s.texture = HEART_DETAILED_FULL
		s.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
		s.custom_minimum_size = Vector2(28, 24)

func update_health(damage_amount):
	for i in range(Global.max_HP):
		if i > Global.HP - 1:
			health_container.get_child(i).texture = HEART_DETAILED_EMPTY
		else:
			health_container.get_child(i).texture = HEART_DETAILED_FULL
	
func update_score(current_score):
	current_score_label.text = "Score\n" + str(current_score) + " pts"
