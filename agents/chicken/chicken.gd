extends CharacterBody2D

@export  var speed := 150.0
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var personal_space : Area2D = $Area2D
var _direction := Vector2.ZERO
var _player: Node2D

func _ready():
	personal_space.body_entered.connect(on_personal_space_entered)
	personal_space.body_exited.connect(on_personal_space_exited)
	#personal_space.connect("body_exited", func (_body: Node2D) -> void:
		#sprite.play("idle")
		#set_physics_process(false)
	#)
	set_physics_process(false)
	
func _physics_process(_delta: float) -> void:
	if not _player:
		return
	_direction = _player.global_position.direction_to(global_position)
	sprite.flip_h = _direction.x < 0
	velocity = speed * _direction
	move_and_slide()

func on_personal_space_entered(body: Node2D):
	_player = body # Assumption: Area2D isn't set to collide with anyone.
	sprite.play("run")
	set_physics_process(true)

func on_personal_space_exited(_body: Node2D):
	sprite.play("idle")
	set_physics_process(false)
