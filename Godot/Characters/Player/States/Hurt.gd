extends State

func enter(entity: Player):
	entity.sprite.modulate = Color("ff0000")
	$Cooldown.start()

func exit(entity):
	entity.sprite.modulate = Color("ffffff")

func step(entity):
	if $Cooldown.is_stopped():
		return $"../Idle"
	
	# actually might not need this script
	entity.velocity = Vector2.RIGHT.rotated(entity.hurt_angle) * (4000 * $Cooldown.time_left)
#	(1000 * ($Cooldown.time_left * 10))
	return null
