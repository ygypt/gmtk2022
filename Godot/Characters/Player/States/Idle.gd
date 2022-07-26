extends State

func enter(entity: Player) -> Node:
	entity.anims.play("Idle")
	return null

func step(entity) -> Node:
	entity.velocity = Vector2.ZERO
	
	if entity.move_vector:
		return $"../Move"
	
	if Input.is_action_just_pressed("dodge") && $"../Dodge/Cooldown".is_stopped():
		return $"../Dodge"
	
	return null
