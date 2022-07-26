extends State

export var dodge_speed := 200

var dodge_direction

func enter(entity) -> Node:
	if not $Cooldown.is_stopped() || !entity.move_vector:
		return $"../Idle"
	
	entity.can_shoot = false
	
	dodge_direction = entity.move_vector
	entity.anims.play("Dodge")
	$Cooldown.one_shot = true
	$Cooldown.start()
	
	return null

func exit(entity):
	entity.can_shoot = true
	entity.sprite.rotation_degrees = 0
	.exit(entity)

func step(entity) -> Node:
	entity.velocity = dodge_direction * dodge_speed
	
	if not entity.anims.is_playing():
		return $"../Idle"
	
	return null
	
