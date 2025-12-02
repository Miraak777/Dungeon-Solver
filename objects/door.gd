extends Node2D
var is_open: bool = false

func open() -> void:
	is_open = true
	$Sprite2D.hide()
	$Sprite2D_open.show()
	$StaticBody2D.collision_layer = 0

func close() -> void:
	is_open = false
	$Sprite2D.show()
	$Sprite2D_open.hide()
	$StaticBody2D.collision_layer = 1
