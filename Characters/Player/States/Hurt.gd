extends State

func enter(entity):
	$Cooldown.start()

func step(entity):
	if $Cooldown.is_stopped():
		return $"../Idle"
	
	# actually might not need this script
	entity.velocity = Vector2.RIGHT.rotated(entity.hurt_angle) * (4000 * $Cooldown.time_left)
#	(1000 * ($Cooldown.time_left * 10))
	return null
