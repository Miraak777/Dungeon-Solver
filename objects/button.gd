extends Node2D
var is_pressed: bool = false

signal button_just_pressed
signal button_just_released


func _on_area_2d_body_entered(_body: Node2D) -> void:
	is_pressed = true
	$Sprite2D.hide()
	$Sprite2D_Pressed.show()
	emit_signal("button_just_pressed")




func _on_area_2d_body_exited(_body: Node2D) -> void:
	if len($Area2D.get_overlapping_bodies()) == 0:
		is_pressed = false
		$Sprite2D.show()
		$Sprite2D_Pressed.hide()
		emit_signal("button_just_released")
		
