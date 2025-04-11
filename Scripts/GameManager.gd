# GameManager.gd  // Global Script
extends Node

var rings_collected = 0

var total_rings = {
	"level_1": 6,
	"level_2": 8
}

func increment_ring_count():
	rings_collected += 1
	print("Rings collected:", rings_collected)

func reset_rings():
	rings_collected = 0
	print("Rings reset")

# Get the total number of rings based on the current scene name
func get_total_rings_for_current_level() -> int:
	var current_scene_path = get_tree().current_scene.scene_file_path
	var scene_name = current_scene_path.get_file().get_basename()  # e.g. "level_1"
	return total_rings.get(scene_name, 0)
