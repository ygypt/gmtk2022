extends Entity

func _ready():
	current_state = $State/Chase

func _process(delta):
	for area in $ProjHurtbox.get_overlapping_areas():
#		if area.is_in_group("Projectile"):
		if area is BulletProjectile:
			health -= area.damage
			area.queue_free()
			if health<=0: 
				queue_free()
