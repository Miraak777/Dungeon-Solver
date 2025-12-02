extends Node

func _ready() -> void:
	var level_dir = DirAccess.open("res://levels")
	
	if level_dir:
		level_dir.list_dir_begin()
		var scene_file: String = level_dir.get_next()
		if scene_file == "":
			push_error("Not found any level in levels dir")
		
		var level_id: int = 0
		
		while scene_file != "":
			var button: Button = $CanvasLayer/LevelSelectMenu/Panel/GridContainer.get_child(level_id)
			button.text = str(level_id + 1)
			button.pressed.connect(get_tree().change_scene_to_file.bind("res://levels/" + scene_file))
			button.disabled = false
			scene_file = level_dir.get_next()
		level_dir.list_dir_end()
	else:
		push_error("Not found levels dir")

func _on_level_select_pressed() -> void:
	$CanvasLayer/LevelSelectMenu.show()
