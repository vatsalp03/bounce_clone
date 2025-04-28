# level_2_end.gd

extends Area2D

func _on_body_entered(body):
	if GameManager.rings_collected == 8:
		print("Level 2 ended")
		GameManager.reset_rings()
		get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
