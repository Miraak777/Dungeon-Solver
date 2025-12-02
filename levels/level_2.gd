extends Node2D

func _on_button_button_just_pressed() -> void:
	$Door.open()


func _on_button_button_just_released() -> void:
	$Door.close()
