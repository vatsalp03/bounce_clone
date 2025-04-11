extends CharacterBody2D

@export var speed = 120            # players speed
@export var jumpforce = 360        # how high can the player jump
@export var player_weight = 1      # no he is not fat 
@export var max_buoyancy = -100 

const gravity = 1000    # newton will be proud

@onready var small_sprite = $small_sprite
@onready var small_collision = $small_collision
@onready var BIG_sprite = $BIG_sprite
@onready var BIG_collision = $BIG_collision

func become_small():
	BIG_collision.disabled = true
	await get_tree().process_frame
	small_collision.disabled = false
	BIG_collision.disabled = true  # Yes, disabling this twice is necessary — Godot likes it that way
	BIG_sprite.visible = false
	small_sprite.visible = true

func become_big():
	small_collision.disabled = true
	await get_tree().process_frame
	BIG_collision.disabled = false
	small_collision.disabled = true  # yes, again — just like BIG_collision before
	small_sprite.visible = false
	BIG_sprite.visible = true
	
func is_big() -> bool:
	return BIG_sprite.visible
	
func _physics_process(delta):

# Add gravity.
	velocity.y += gravity * player_weight * delta
	if velocity.y > 200:
		velocity.y = 200
	if  BIG_sprite.visible && player_weight < 0 && velocity.y < max_buoyancy:    # added to stop water buoyancy
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
		small_sprite.flip_h = false
		BIG_sprite.flip_h = false
#		small_animated.play("walk")
	elif direction == -1:
		small_sprite.flip_h = true
		BIG_sprite.flip_h = true
#		small_animated.play("walk")
#	else:
#		small_animated.play("idle")
		
	move_and_slide()
	
	
# if the sprite if big or small
func _ready():
	var current_scene_path = get_tree().current_scene.scene_file_path
	var scene_name = current_scene_path.get_file().get_basename()

	if scene_name == "level_1":
		become_small()
	elif scene_name == "level_2":
		become_big()
