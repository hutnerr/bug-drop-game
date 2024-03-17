extends CharacterBody2D

signal bugCollected
signal damageTaken

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		$Sprite.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_net_area_entered(area):
	if area.is_in_group("bugs"):
		bugCollected.emit()
	elif area.is_in_group("hazards"):
		damageTaken.emit()
