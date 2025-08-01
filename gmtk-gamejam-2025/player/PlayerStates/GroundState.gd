extends State

class_name GroundState

const JUMP_VELOCITY = -400.0
@export var air_state : State

func state_process(delta : float):
	if not character.is_on_floor():
		next_state = air_state

func state_input(event : InputEvent):
	if Input.is_action_pressed("jump"):
		jump()
		
func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
