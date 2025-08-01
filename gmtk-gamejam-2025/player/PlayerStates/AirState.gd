extends State

class_name AirState

@export var double_jump_speed = -400
var has_double_jumped : bool = false

@export var ground_state : State

func state_process(delta):
	if(character.is_on_floor()):
		next_state = ground_state

func state_input(event: InputEvent):
	if event.is_action_pressed("jump") and not has_double_jumped and Global.unlocked_double_jump:
		double_jump()

func on_exit():
	if (next_state == ground_state):
		has_double_jumped = false

func double_jump():
	character.velocity.y = double_jump_speed
	has_double_jumped = true
