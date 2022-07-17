extends Entity

func _ready():
	current_state = $State/Chase

func _process(delta):
<<<<<<< Updated upstream
	for body in $ProjHurtbox.get_overlapping_areas():
		if body.shooter.is_in_group("Player"):
			health -= body.damage
			body.queue_free()
=======
	for area in $ProjHurtbox.get_overlapping_areas():
		if area.shooter.is_in_group("Player"):
			health -= area.damage
			area.queue_free()
>>>>>>> Stashed changes
			if health<=0: 
				queue_free()
