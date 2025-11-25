extends CharacterBody2D

@export var move_speed: float = 200

#var is_moving: bool = false

func _physics_process(_delta: float) -> void:
	handle_movement()

func handle_movement() -> void:
	velocity = Vector2.ZERO
	var direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	#if direction.length() > 0:
		#is_moving = true
	#else:
		#is_moving = false
	velocity = direction * move_speed
	move_and_slide()
