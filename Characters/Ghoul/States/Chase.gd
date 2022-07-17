extends State

func step(entity):
	var angle_to_player := 0.0
	
	for player in get_tree().get_nodes_in_group("Player"):
		angle_to_player = entity.get_angle_to(player.position)
	
	var vec = Vector2.RIGHT.rotated(angle_to_player)
	entity.velocity = vec * entity.speed
