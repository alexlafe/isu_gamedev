extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var alive = true
var speed = 100

@onready var anim = $AnimatedSprite2D
@onready var grinch_music = $grinch_music

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	anim.play("Idle")
	
	var player = $"../../Player"
	var direction = (player.position - self.position).normalized()
	if chase == true:
		velocity.x = direction.x * speed
	else:
		velocity.x = 0
		
	if direction.x < 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()


func _on_detector_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_detector_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		chase = false


func _on_death_body_entered(body):
	if body.name == "Player":
		body.velocity.y -= 300
		death()
		
func _on_player_damage_body_entered(body):
	if body.name == "Player":
		body.velocity.y -= 300
		if alive == true:
			body.anim.play("Hurt")
			body.health -= 20
	
func death ():
	if Global.is_sounds_on == true:
		grinch_music.play()
		await grinch_music.finished
	alive = false
	Global.scene_grinches -= 1
	queue_free()



