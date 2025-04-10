extends Area2D

@onready var kill_timer = $Timer


func _on_body_entered(body):
	print("you are kaput!")
	kill_timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
