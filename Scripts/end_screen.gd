# end_screen.gd

extends CanvasLayer

func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
