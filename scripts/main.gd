extends Node

var score = 0
var health = 5

func _on_timer_timeout():
	spawn_bug()

func spawn_bug():
	var new_mob = preload("res://scenes//bug.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	new_mob.add_to_group("bugs")
	add_child(new_mob)

func _on_player_bug_collected():
	score += 1
	%"Score Label".text = "Score: " + str(score)

func _on_anivl_timer_timeout():
	spawn_anvil()
	
func spawn_anvil():
	var anvil = preload("res://scenes/anvil.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	anvil.global_position = %PathFollow2D.global_position
	anvil.add_to_group("hazards")
	add_child(anvil)

func _on_player_damage_taken():
	health -= 1
	%"Health Label".text = "Health: " + str(health)
	if health <= 0:
		%GameOver.visible = true
		get_tree().paused = true
