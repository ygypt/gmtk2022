extends State

export var dodge_speed := 150

var dodge_direction

func enter(entity : Player) -> Node:
	if not $Cooldown.is_stopped():
		return $"../Idle"
	
	dodge_direction = entity.look_vector
	entity.anims.play("Dodge")
	$Cooldown.one_shot = true
	$Cooldown.start()
	
	return null

func step(entity : Player) -> Node:
	entity.velocity = -Vector2.RIGHT.rotated(dodge_direction) * dodge_speed
	
	if not entity.anims.is_playing():
		return $"../Idle"
	
	return null
