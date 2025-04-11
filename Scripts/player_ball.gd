extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 120            # player speed
@export var jumpforce = 360        # how high can the player jump
@export var player_weight = 1      # no he is not fat 
@export var max_buoyancy = -100 

const gravity = 1000    # newton will be proud

func _physics_process(delta):

# Add gravity.
	velocity.y += gravity * player_weight * delta
	if velocity.y > 200:
		velocity.y = 200
	if player_weight < 0 && velocity.y < max_buoyancy:    # added to stop water buoyancy
		velocity.y = max_buoyancy

# Add jump
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jumpforce 

# Add movement
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = 0

# Animations and sprite flipping
	if direction == 1:
		sprite_2d.flip_h = false
#		animated_sprite_2d.play("walk")
	elif direction == -1:
		sprite_2d.flip_h = true
#		animated_sprite_2d.play("walk")
#	else:
#		animated_sprite_2d.play("idle")
		
	move_and_slide()
