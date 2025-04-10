extends Area2D

func _on_body_entered(body):
	print("i am under the water please help me")
	body.player_weight = -1

func _on_body_exited(body):
	body.player_weight = 1
	body.velocity.y = 0      # reset vertical speed
