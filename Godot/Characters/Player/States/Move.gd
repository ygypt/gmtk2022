extends State

func step(entity) -> Node:
	entity.velocity = entity.move_vector * entity.speed
	
	if entity.move_vector.y >= 0:
		entity.anims.play("Move_down")
	else:
		entity.anims.play("Move_up")
		
	if not entity.move_vector:
		return $"../Idle"
		
	if Input.is_action_just_pressed("dodge") && $"../Dodge/Cooldown".is_stopped():
		return $"../Dodge"
	
	return null
