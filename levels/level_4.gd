extends Node2D


func _on_button_button_just_pressed() -> void:
	$DoorHorizontal.open()


func _on_button_button_just_released() -> void:
	$DoorHorizontal.close()


func _on_button_2_button_just_pressed() -> void:
	$DoorVertical.open()


func _on_button_2_button_just_released() -> void:
	$DoorVertical.close()
