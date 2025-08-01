extends CharacterBody2D
class_name Player

const SPEED = 300.0
const ACCELERATION = 35
const JUMP_VELOCITY = -450.0

var facing_right : bool = true

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_player: AnimationPlayer = $HitPlayer

var disable_input : bool = false

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not disable_input:
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

	if not disable_input:
		if direction:
			velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION)
		else:
			velocity.x = move_toward(velocity.x, 0, ACCELERATION)

	move_and_slide()
