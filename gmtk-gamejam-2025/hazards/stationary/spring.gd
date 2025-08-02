extends Node2D

@onready var spring_animation: AnimationPlayer = $SpringAnimation
@export var spring_power = 635

func _on_player_detect_body_entered(body: Node2D) -> void:
	if body is Player:
		#if not body.is_on_floor() and body.velocity.y > 0:
		body.velocity.y = spring_power * -1
		spring_animation.play("default")
		$SpringSFX.play()
