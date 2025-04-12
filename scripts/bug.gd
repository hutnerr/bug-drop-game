extends Area2D

var velocity = Vector2.ZERO
var speed = randi_range(150, 250)

const SPRITES = [
"res://assets/1709506744300.png",
"res://assets/1709512145550.png",
"res://assets/1709513277556.png",
"res://assets/1709514718113.png",
"res://assets/1709516921764.png",
"res://assets/1709520235487.png",
"res://assets/1709582132477.png",
"res://assets/1709592040025.png",
"res://assets/1709606466733.png"
]

func _ready():
	$BugSprite.texture = load(SPRITES[randi() % SPRITES.size()])

func _physics_process(delta):
	position.y += speed * delta
