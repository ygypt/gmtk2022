extends Entity

func _ready():
	current_state = $State/Chase

func _process(delta):
	for body in $ProjHurtbox.get_overlapping_areas():
		if body.shooter.is_in_group("Paaalayer"):
			health -= body.damage
			body.queue_free()
			if health<=0: 
				$ProjHurtbox.free()
				queue_free()
