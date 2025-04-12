extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_button_pressed():
	print("quit button")
	get_tree().quit()


func _on_retry_button_pressed():
	print("retry button")
	get_tree().paused = false
	get_tree().reload_current_scene()
