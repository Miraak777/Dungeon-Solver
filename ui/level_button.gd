extends Button

@export var Level: PackedScene

func _pressed() -> void:
	get_tree().change_scene_to_packed(Level)
