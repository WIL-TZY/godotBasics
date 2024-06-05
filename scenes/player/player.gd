extends CharacterBody2D

@export var speed : float = 150.0
@export var jump_velocity : float = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer") # Could be $AnimationPlayer too

# Player States (to use later)
enum e_State { IDLE, WALK, JUMP }
var current_state : e_State

func _physics_process(delta):
	# Add the gravity (fall).
	if not is_on_floor():
		velocity.y += gravity * delta # Velocity here is greater than 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity # Velocity here less than 0
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Mirroring the sprite when player is going left
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		
	if direction:
		velocity.x = direction * speed # should add delta here?
		if velocity.y == 0: # On floor
			anim.play("walk")
	else: # Not moving
		# Changing the velocity's x to 0 in a speed amount (to decelerate)
		velocity.x = move_toward(velocity.x, 0, speed) # should add delta here?
		if velocity.y == 0: # On floor
			anim.play("idle")
	
	if velocity.y > 0:
		anim.play("fall")
		
	# Built-in Godot function to handle friction
	move_and_slide()
