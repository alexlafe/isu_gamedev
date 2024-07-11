extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var gift_music = $gift_music

func _physics_process(delta):
	anim.play("Idle")

func _on_body_entered(body):
	if body.name == "Player":
		if Global.is_sounds_on == true:
			gift_music.play()
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 40), 0.3)
		
		var tween1 = get_tree().create_tween()
		tween1.tween_property(self, "modulate:a", 0, 0.3)
		
		tween.tween_callback(queue_free)
		
		Global.scene_gifts -= 1
		body.gifts += 1
		
