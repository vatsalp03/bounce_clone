extends Area2D
@onready var small_ring: CharacterBody2D = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"


func _on_body_entered(body):
	print("entered")
	animated_sprite_2d.play("gray")
