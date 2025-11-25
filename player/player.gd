extends CharacterBody2D

@export var move_speed: float = 200

enum LookSides {UP, DOWN, RIGHT, LEFT}

var looking_direction: LookSides = LookSides.DOWN

var idle_animation_dict: Dictionary = {
	LookSides.UP: "idle_up",
	LookSides.DOWN: "idle_down",
	LookSides.RIGHT: "idle_right",
	LookSides.LEFT: "idle_left",
}

var is_moving: bool = false

func _process(_delta: float) -> void:
	if is_moving:
		handle_moving_animations()
	else:
		handle_idle_animations()

func handle_moving_animations() -> void:
	if Input.is_action_pressed("MoveUp"):
		looking_direction = LookSides.UP
		$AnimatedSprite2D.play("move_up")
		
	if Input.is_action_pressed("MoveDown"):
		looking_direction = LookSides.DOWN
		$AnimatedSprite2D.play("move_down")
		
	if Input.is_action_pressed("MoveRight"):
		looking_direction = LookSides.RIGHT
		$AnimatedSprite2D.play("move_right")
		
	if Input.is_action_pressed("MoveLeft"):
		looking_direction = LookSides.LEFT
		$AnimatedSprite2D.play("move_left")

func handle_idle_animations() -> void:
	$AnimatedSprite2D.play(idle_animation_dict[looking_direction])

func _physics_process(_delta: float) -> void:
	handle_movement()

func handle_movement() -> void:
	velocity = Vector2.ZERO
	var direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	velocity = direction * move_speed
	if velocity != Vector2.ZERO:
		is_moving = true
	else:
		is_moving = false
	move_and_slide()
