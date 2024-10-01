extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_scenes_as_tiles_button_pressed():
	get_tree().change_scene_to_file("res://scene_as_tiles_example.tscn")

func _on_animated_tile_button_pressed():
	get_tree().change_scene_to_file("res://animated_tiles_example.tscn")

func _on_show_grid_button_pressed():
	get_tree().change_scene_to_file("res://show_grid_example.tscn")

func _on_custom_data_button_pressed():
	get_tree().change_scene_to_file("res://custom_data_example.tscn")
