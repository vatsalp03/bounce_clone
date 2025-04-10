extends Area2D

func _on_body_entered(body):
	print("Level 1 ended")
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
