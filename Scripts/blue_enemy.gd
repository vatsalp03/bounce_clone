extends CharacterBody2D

const enemy_speed = 40
var enemy_direction = 1

@onready var raycast_up = $raycastUp
@onready var raycast_down = $raycastDown

func _process(delta):
	if raycast_up.is_colliding():
		enemy_direction = 1
	elif raycast_down.is_colliding():
		enemy_direction = -1
	position.y += enemy_speed * enemy_direction * delta
