extends State

func enter(entity):
	entity.anims.play("chase")

func step(entity):
	if entity.cooldown.is_stopped():
		return $"../Cast"
	
	var vec = Vector2.RIGHT.rotated(entity.angle_to_player)
	
	if entity.player_distance < 80:
		entity.velocity = -vec * entity.speed
		
	elif entity.player_distance > 90:
		entity.velocity = vec * entity.speed
	
	
	
