extends Node2D

@onready var music = $music
@onready var active = $active
@onready var hover = $hover

func _on_start_pressed():
	if Global.is_sounds_on == true:
		active.play()
		await active.finished
	get_tree().change_scene_to_file("res://levels/main_level.tscn")

func _on_sound_on_off_pressed():
	if Global.is_sounds_on == true:
		$"СтартовыйУровень/Sound on_off".text = "Sound on"
		music.volume_db = -80
		Global.is_sounds_on = false
		
		active.play()
		await active.finished
	else:
		$"СтартовыйУровень/Sound on_off".text = "Sound off"
		music.volume_db = 0
		Global.is_sounds_on = true

func _on_exit_pressed():
	if Global.is_sounds_on == true:
		active.play()
		await active.finished
	queue_free()


func _on_start_mouse_entered():
	if Global.is_sounds_on == true:
		hover.play()


func _on_sound_on_off_mouse_entered():
	if Global.is_sounds_on == true:
		hover.play()


func _on_exit_mouse_entered():
	if Global.is_sounds_on == true:
		hover.play()
