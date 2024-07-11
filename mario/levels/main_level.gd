extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_portal_1_body_entered(body):
	if body.name == "Player":
		body.position.x = 1750
		body.position.y = 615


func _on_portal_2_body_entered(body):
	if body.name == "Player":
		body.position.x = 1455
		body.position.y = 503


func _on_portal_3_body_entered(body):
	if body.name == "Player":
		body.position.x = 805
		body.position.y = 540


func _on_portal_4_body_entered(body):
	if body.name == "Player":
		body.position.x = 320
		body.position.y = 503
