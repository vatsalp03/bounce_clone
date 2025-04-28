# water_area.gd

extends Area2D

func _on_body_entered(body):
	if body.has_method("is_big") and body.is_big():
		print("Big player entered water — buoyancy on")
		body.player_weight = -1
	else:
		print("Small player entered water — no buoyancy")
		body.player_weight = 1  # small form uses normal gravity

func _on_body_exited(body):
	print("Exited water")
	body.player_weight = 1
	body.velocity.y = 0
