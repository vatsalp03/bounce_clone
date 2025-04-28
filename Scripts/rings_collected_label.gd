# rings_collected_label.gd

extends Label

func _process(_delta):
	var current = GameManager.rings_collected
	var total = GameManager.get_total_rings_for_current_level()
	text = "Rings: %d of %d" % [current, total]
