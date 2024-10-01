extends CharacterBody2D

@export var speed := 200.0
@export var acceleration := 4000.0
@export var decceleration := 5000.0
@export var aim_deadzone := 0.2

@export var terrain : TileMap

var _direction := Vector2.DOWN
var _input_direction := Vector2.ZERO
var terrain_speed_divisor := 1.0

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	#--- get_axis returns strength of the second option - first option.
	#--- Useful if your idiot player is pushing left and right at the same time?
	_input_direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).limit_length(1.0)
	#--- This code steers him like a car. It makes the character move silly.
	if _input_direction:
		var effective_speed = (speed / get_terrain_speed_penalty())
		velocity += _input_direction * acceleration * delta
		velocity = velocity.limit_length(effective_speed * _input_direction.length())
		#if _input_direction.length() > aim_deadzone:
			#_direction = _input_direction.normalized()
		if (_input_direction.x < 0):
			sprite.play("left")
		elif (_input_direction.x > 0):
			sprite.play("right")
		elif (_input_direction.y < 0):
			sprite.play("up")
		elif (_input_direction.y > 0):
			sprite.play("down")
	else:
		#--- This makes him NOT stop on a dime. No instant stops or pivots. Moves like a car.
		velocity = velocity.move_toward(Vector2.ZERO, decceleration * delta)
		#velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	move_and_slide()

#func on_terrain_speed_change(new_terrain_speed_divisor : float):
	#terrain_speed_divisor = new_terrain_speed_divisor
func get_terrain_speed_penalty() -> float:
	var tile_data : TileData = terrain.get_tile_data_at_global(position)
	var terrain_cost = tile_data.get_custom_data("terrain_cost")
	#print("terrain_cost=" + str(terrain_cost))
	return terrain_cost
