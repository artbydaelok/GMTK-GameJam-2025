extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var disable_input_timer: Timer = $DisableInputTimer

var player : Player

func _on_player_detect_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		var vel = global_position.direction_to(body.global_position + Vector2(0, -16)) * 400
		body.disable_input = true
		body.velocity = vel
		animation_player.play("bump")
		disable_input_timer.start()
		


func _on_disable_input_timer_timeout() -> void:
	player.disable_input = false
