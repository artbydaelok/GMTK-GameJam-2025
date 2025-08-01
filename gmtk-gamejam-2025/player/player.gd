extends CharacterBody2D
class_name Player

const SPEED = 350.0
const JUMP_VELOCITY = -500.0

var facing_right : bool = true

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	
	if direction == 1: 
		facing_right = true
		player_sprite.flip_h = false
	elif direction == -1:
		player_sprite.flip_h = true
		facing_right = false
	
	
	var anim_blend = Vector2.ZERO
	anim_blend.x = velocity.sign().x
	
	if is_on_floor():
		anim_blend.y = 0
	else:
		anim_blend.y = velocity.sign().y
	
	animation_tree.set("parameters/Move/blend_position", anim_blend)

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
