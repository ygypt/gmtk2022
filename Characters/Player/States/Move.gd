extends State

func enter(entity: Player) -> Node:
	entity.anims.play("Move")
	return null

func step(entity) -> Node:
	entity.velocity = entity.move_vector * entity.speed
	
	if not entity.move_vector:
		return $"../Idle"
		
	if Input.is_action_just_pressed("dodge") && $"../Dodge/Cooldown".is_stopped():
		return $"../Dodge"
	
	return null
