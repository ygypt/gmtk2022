extends State

var fireball = preload("res://Projectiles/Fireball/Fireball.tscn")

func enter(entity):
	entity.anims.play("cast")
	$CastTimer.start()
	entity.velocity = Vector2.ZERO

func step(entity):
	if $CastTimer.is_stopped():
		return $"../Chase"
	if entity.cooldown.is_stopped():
		
		var fireball_pos = Vector2(entity.global_position.x,
							entity.global_position.y - 15)
		
		ProjectileManager.spawn_projectile(
			fireball.instance(),
			fireball_pos,
			entity.angle_to_player,
			entity)
			
		entity.cooldown.start()
	
	return null
#	ProjectileManager.spawn_projectile()
