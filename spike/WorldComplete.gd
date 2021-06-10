extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			pass
			#get.tree().change_scene(Screen2.tscn)
