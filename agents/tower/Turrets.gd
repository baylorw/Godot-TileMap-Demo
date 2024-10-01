extends Node2D

#--- ".." is the TileMap so "../.." is the root scene
@onready var player = $"../../Player"

func _ready():
	pass
	
func _physics_process(delta):
	#if not p2:
		#print("Can't find p2. p2=" + str(p2))
	if not player:
		print("Can't find $Player. $Player=" + str(player))
		return
	turn()
	
func turn():
	#var enemy_position = get_global_mouse_position()
	var enemy_position = player.global_position
	get_node("Turret").look_at(enemy_position)
	
