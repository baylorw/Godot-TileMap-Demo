extends CanvasLayer

@onready var tileMap : TileMap = $"../Blockers"

func _on_show_grid_lines_button_pressed():
	#--- We don't track the status so let's just toggle it.
	tileMap.show_grid(!tileMap.should_show_grid)

func _on_show_available_button_pressed():
	print("button pressed")
	tileMap.show_availability(!tileMap.should_show_availability)
