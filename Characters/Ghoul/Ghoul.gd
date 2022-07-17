extends Entity

func _ready():
	current_state = $State/Chase

func _process(delta):
	for body in $ProjHurtbox.get_overlapping_areas():
		if body.shooter.is_in_group("Player"):
			health -= body.damage
			body.queue_free()
			print(health)
