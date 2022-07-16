extends State

func step(entity):
	entity.velocity = Vector2.RIGHT.rotated(entity.look_vector) * entity.speed
