extends Area2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	position.y += 200 * delta
