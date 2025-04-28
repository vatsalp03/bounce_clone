# small_ring_passthrough.gd

extends Area2D
@onready var small_ring: CharacterBody2D = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

@onready var top_collision = $"../top_collision"
@onready var botton_collision = $"../botton_collision"

var ring_activated = false      # prevent double counting

func _on_body_entered(body):
	if ring_activated == false:
		print("small ring entered")
		ring_activated = true     
		animated_sprite_2d.play("gray")
		GameManager.increment_ring_count()
