extends CharacterBody2D


@export var speed = 150.0
@export var jump_force = 250.0

@onready var smol_slime = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

# Add Gravity
	if !is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 250:
			velocity.y = 250

# Code for jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		


# Get directions from user input
	var direction := Input.get_axis("move_left", "move_right")

#Flip the sprite
	if direction > 0:
		smol_slime.flip_h = false
	elif direction < 0:
		smol_slime.flip_h = true
	
# Play animation
	if direction == 0:
		smol_slime.play("idle")
	else:
		smol_slime.play("walk")

# Use directions to move
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
