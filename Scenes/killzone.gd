extends Area2D

@onready var kill_timer = $Timer



func _on_body_entered(body):
	print("you are kaput!")
	kill_timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
