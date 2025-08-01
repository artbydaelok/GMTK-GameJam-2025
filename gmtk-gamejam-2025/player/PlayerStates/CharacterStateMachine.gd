extends Node
class_name CharacterStateMachine

var states : Array[State]

@export var character : CharacterBody2D
@export var current_state : State

func _ready() -> void:
	for child in get_children():
		if (child is State):
			states.append(child)
			
			# Set the states up with what they need to function
			child.character = character
			
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")

func _input(event: InputEvent) -> void:
	current_state.state_input(event)

func _physics_process(delta: float) -> void:
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)
		
func switch_states(new_state: State):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	current_state.on_enter()
	print(current_state)

func check_if_can_move():
	return current_state.can_move
