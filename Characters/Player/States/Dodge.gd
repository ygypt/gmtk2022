extends State

export var dodge_speed := 200

var dodge_direction

func enter(entity : Player) -> Node:
	if not $Cooldown.is_stopped():
		return $"../Idle"
	
	entity.can_shoot = false
	
	dodge_direction = entity.look_vector
	entity.anims.play("Dodge")
	$Cooldown.one_shot = true
	$Cooldown.start()
	
	return null

func exit(entity):
	entity.can_shoot = true
	.exit(entity)

func step(entity : Player) -> Node:
	entity.velocity = Vector2.RIGHT.rotated(dodge_direction) * dodge_speed
	
	if not entity.anims.is_playing():
		return $"../Idle"
	
	return null
	
