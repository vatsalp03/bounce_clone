extends CharacterBody2D

@onready var sprite_2d = $Sprite2D

@export var speed = 150
@export var jumpforce = 365

const gravity = 1000
const player_weight = 1
var jump_counter = 0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * player_weight * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jumpforce

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = 0

	if direction == 1:
		sprite_2d.flip_h = false
	elif direction == -1:
		sprite_2d.flip_h = true

	move_and_slide()
