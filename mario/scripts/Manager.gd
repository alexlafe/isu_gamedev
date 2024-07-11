extends Node

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Global.game_paused = !Global.game_paused
		
	if Global.game_paused == true:
		get_tree().paused = true
		get_tree().change_scene_to_file("res://levels/menu.tscn")
		
	else:
		get_tree().paused = false
