extends Area2D

var velocity = Vector2.ZERO
var speed = randi_range(50, 500)

func _physics_process(delta):
	position.y += speed * delta

# This is a note to check if git is working
