extends Node2D

@export var next_level: PackedScene

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if next_level:
			get_tree().change_scene_to_packed(next_level)
		else:
			get_tree().change_scene_to_file("res://ui/main_menu.tscn")
