extends Area2D

func _on_body_entered(body):
	if GameManager.rings_collected == 6:
		print("Level 1 ended")
		GameManager.reset_rings()
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
