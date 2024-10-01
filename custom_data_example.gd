extends Node2D

@onready var tile_map = $TileMap
@onready var player = $Zombie

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
	elif event.is_action_pressed("left_clicked"):
		var tile_data = get_tile_data()
		var terrain_cost = tile_data.get_custom_data("terrain_cost")
		print("terrain_cost=" + str(terrain_cost))

func get_tile_data() -> TileData:
	var tile_data = tile_map.get_tile_data_at_global(get_global_mouse_position())
	#var mouse_position_global = get_global_mouse_position()
	#var mouse_position_local = tile_map.to_local(mouse_position_global)
	#var mouse_position_tilemap = tile_map.local_to_map(mouse_position_local)
	#var tile_data : TileData = tile_map.get_cell_tile_data(0, mouse_position_tilemap)
	return tile_data
	
func is_empty(global_position : Vector2i) -> bool:
	return tile_map.is_empty_at_global()
#func is_empty(tile_position : Vector2i, layer : int = 0) -> bool:
	#var source_id = tile_map.get_cell_source_id(layer, tile_position)
	#@warning_ignore("shadowed_variable")
	#var is_empty = (-1 == source_id)
	#return is_empty


