extends State

# RIGHT IS THE DEFAULT DIRECTION IN RADIANS, SO THIS IS HOW U GO FORWARD

func step(entity):
	entity.velocity = Vector2.RIGHT.rotated(entity.look_angle) * entity.speed
